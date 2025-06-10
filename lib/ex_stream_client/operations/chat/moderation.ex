defmodule ExStreamClient.Operations.Chat.Moderation do
  @moduledoc ~S"""
  Modules for interacting with the `chat/moderation` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
   * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options
  """
  require Logger

  @type shared_opts :: [
          api_key: String.t(),
          api_key_secret: String.t(),
          client: module(),
          endpoint: String.t(),
          req_opts: keyword()
        ]
  @doc ~S"""
  Find and filter message flags


  ### Optional Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryMessageFlagsPayload`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_message_flags() ::
          {:ok, ExStreamClient.Model.QueryMessageFlagsResponse.t()} | {:error, any()}
  @spec query_message_flags([
          {:payload, ExStreamClient.Model.QueryMessageFlagsPayload.t()} | shared_opts
        ]) :: {:ok, ExStreamClient.Model.QueryMessageFlagsResponse.t()} | {:error, any()}
  def query_message_flags(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/moderation/flags/message",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.QueryMessageFlagsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Unmutes channel for user

  ### Sends events:
  - `channel.unmuted`
  - `channel.unmuted`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UnmuteChannelRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec unmute_channel(ExStreamClient.Model.UnmuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  @spec unmute_channel(ExStreamClient.Model.UnmuteChannelRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  def unmute_channel(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/moderation/unmute/channel", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UnmuteResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Mutes channel for user

  ### Sends events:
  - `channel.muted`
  - `channel.muted`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.MuteChannelRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec mute_channel(ExStreamClient.Model.MuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.MuteChannelResponse.t()} | {:error, any()}
  @spec mute_channel(ExStreamClient.Model.MuteChannelRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.MuteChannelResponse.t()} | {:error, any()}
  def mute_channel(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/moderation/mute/channel", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.MuteChannelResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end

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

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
