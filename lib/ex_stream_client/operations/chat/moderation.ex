defmodule ExStreamClient.Operations.Chat.Moderation do
  @moduledoc ~S"""
  Modules for interacting with the `chat/moderation` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Find and filter message flags


  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  - `payload`: `Elixir.ExStreamClient.Model.QueryMessageFlagsPayload`
  """
  @spec query_message_flags() ::
          {:ok, ExStreamClient.Model.QueryMessageFlagsResponse.t()} | {:error, any()}
  @spec query_message_flags([
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:payload, ExStreamClient.Model.QueryMessageFlagsPayload.t()}
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

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_type =
            if response.status in 200..299 do
              :ok
            else
              :error
            end

          response_handlers = %{
            200 => ExStreamClient.Model.QueryMessageFlagsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
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
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec unmute_channel(ExStreamClient.Model.UnmuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  @spec unmute_channel(ExStreamClient.Model.UnmuteChannelRequest.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  def unmute_channel(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/moderation/unmute/channel", method: :post, params: []] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_type =
            if response.status in 200..299 do
              :ok
            else
              :error
            end

          response_handlers = %{
            201 => ExStreamClient.Model.UnmuteResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
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
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec mute_channel(ExStreamClient.Model.MuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.MuteChannelResponse.t()} | {:error, any()}
  @spec mute_channel(ExStreamClient.Model.MuteChannelRequest.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.MuteChannelResponse.t()} | {:error, any()}
  def mute_channel(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/moderation/mute/channel", method: :post, params: []] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_type =
            if response.status in 200..299 do
              :ok
            else
              :error
            end

          response_handlers = %{
            201 => ExStreamClient.Model.MuteChannelResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
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

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
