defmodule ExStreamClient.Http do
  @moduledoc """
  Client for making requests to the Stream API.
  """
  @behaviour ExStreamClient.Http.Behavior

  require Logger

  @static_headers [
    {"stream-auth-type", "jwt"},
    {"content-type", "application/json"},
    {"accept-encoding", "gzip"},
    {"accept", "application/json"}
  ]

  @doc """
  Makes a request to the Stream API. This function is called by the generated operations modules.
  """
  @impl true
  @spec request(Req.Request.t(), Keyword.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def request(%Req.Request{} = request, opts) do
    url = Keyword.get(opts, :endpoint, ExStreamClient.Config.endpoint())
    api_key = Keyword.get(opts, :api_key, ExStreamClient.Config.api_key())
    api_key_secret = Keyword.get(opts, :api_key_secret, ExStreamClient.Config.api_key_secret())
    response_handlers = Keyword.get(opts, :response_handlers, %{})

    token =
      case ExStreamClient.Token.Server.get(api_key, api_key_secret) do
        {:ok, token} ->
          token

        {:error, reason} ->
          Logger.error("[ex_stream_client] Failed to get auth token: #{inspect(reason)}]")
          {:error, reason}
      end

    request
    |> Req.merge(base_url: url, params: [api_key: api_key])
    |> Req.Request.put_header(
      "authorization",
      token
    )
    |> Req.Request.put_headers(@static_headers)
    |> encode_query_structs()
    |> decode_error_json(response_handlers)
    |> log_request()
    |> log_response()
    |> Req.request()
  end

  defp encode_query_structs(request),
    do:
      request
      |> Req.Request.prepend_request_steps(
        encode_query_structs: fn request ->
          encoded_params =
            Enum.map(request.options[:params] || [], fn {k, v} ->
              {k, if(String.Chars.impl_for(v), do: v, else: Jason.encode!(v))}
            end)

          Req.merge(request, params: encoded_params)
        end
      )

  defp log_request(request),
    do:
      request
      |> Req.Request.append_request_steps(
        debug_url: fn request ->
          if ExStreamClient.Config.log_enabled?(:request, :url) do
            Logger.log(
              ExStreamClient.Config.log_level(),
              "Requesting #{URI.to_string(request.url)}"
            )
          end

          if ExStreamClient.Config.log_enabled?(:request, :body) and request.body do
            Logger.log(ExStreamClient.Config.log_level(), "Request body: #{request.body}")
          end

          request
        end
      )

  defp log_response(request),
    do:
      request
      |> Req.Request.append_response_steps(
        debug_response: fn {request, response} ->
          if ExStreamClient.Config.log_enabled?(:response, :status) do
            Logger.log(ExStreamClient.Config.log_level(), "Response status: #{response.status}")
          end

          {request, response}
        end
      )

  defp decode_error_json(request, response_handlers),
    do:
      request
      |> Req.Request.append_response_steps(
        decode_error_json: fn {request, response} ->
          if response.status in 400..599 and is_binary(response.body) do
            case Jason.decode(response.body, keys: :strings) do
              {:ok, decoded} -> {request, %{response | body: decoded}}
              _ -> {request, response}
            end
          else
            {request, response}
          end
        end,
        decode: fn {request, response} ->
          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

  defp decode_response(response, response_handlers) do
    case Map.get(response_handlers, response.status) do
      nil -> {:error, response.body}
      mod -> {get_response_type(response), mod.decode(response.body)}
    end
  end

  defp get_response_type(response) do
    if response.status in 200..299 do
      :ok
    else
      :error
    end
  end
end
