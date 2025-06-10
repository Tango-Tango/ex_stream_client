defmodule ExStreamClient.Operations.Chat.Channeltypes do
  @moduledoc ~S"""
  Modules for interacting with the `chat/channeltypes` group of Stream APIs

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
  Updates channel type


  ### Required Arguments:
  - `name`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateChannelTypeRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_channel_type(String.t(), ExStreamClient.Model.UpdateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateChannelTypeResponse.t()} | {:error, any()}
  @spec update_channel_type(
          String.t(),
          ExStreamClient.Model.UpdateChannelTypeRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.UpdateChannelTypeResponse.t()} | {:error, any()}
  def update_channel_type(name, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/channeltypes/#{name}", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateChannelTypeResponse,
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
  Gets channel type


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.GetChannelTypeResponse.t()} | {:error, any()}
  @spec get_channel_type(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.GetChannelTypeResponse.t()} | {:error, any()}
  def get_channel_type(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetChannelTypeResponse,
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
  Deletes channel type


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_channel_type(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_channel_type(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.Response,
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
  Creates new channel type


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateChannelTypeRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_channel_type(ExStreamClient.Model.CreateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateChannelTypeResponse.t()} | {:error, any()}
  @spec create_channel_type(ExStreamClient.Model.CreateChannelTypeRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CreateChannelTypeResponse.t()} | {:error, any()}
  def create_channel_type(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/channeltypes", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateChannelTypeResponse,
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
  Lists all available channel types


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_channel_types() ::
          {:ok, ExStreamClient.Model.ListChannelTypesResponse.t()} | {:error, any()}
  @spec list_channel_types(shared_opts) ::
          {:ok, ExStreamClient.Model.ListChannelTypesResponse.t()} | {:error, any()}
  def list_channel_types(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/channeltypes", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListChannelTypesResponse,
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
