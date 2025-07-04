defmodule ExStreamClient.Operations.ExternalStorage do
  @moduledoc ~S"""
  Modules for interacting with the `external_storage` group of Stream APIs

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



  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec check_external_storage(String.t()) ::
          {:ok, ExStreamClient.Model.CheckExternalStorageResponse.t()} | {:error, any()}
  @spec check_external_storage(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CheckExternalStorageResponse.t()} | {:error, any()}
  def check_external_storage(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/external_storage/#{name}/check", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.CheckExternalStorageResponse,
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
  Creates new external storage


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateExternalStorageRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_external_storage(ExStreamClient.Model.CreateExternalStorageRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateExternalStorageResponse.t()} | {:error, any()}
  @spec create_external_storage(
          ExStreamClient.Model.CreateExternalStorageRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.CreateExternalStorageResponse.t()} | {:error, any()}
  def create_external_storage(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/external_storage", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateExternalStorageResponse,
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
  Lists external storage


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_external_storage() ::
          {:ok, ExStreamClient.Model.ListExternalStorageResponse.t()} | {:error, any()}
  @spec list_external_storage(shared_opts) ::
          {:ok, ExStreamClient.Model.ListExternalStorageResponse.t()} | {:error, any()}
  def list_external_storage(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/external_storage", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListExternalStorageResponse,
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



  ### Required Arguments:
  - `name`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateExternalStorageRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_external_storage(String.t(), ExStreamClient.Model.UpdateExternalStorageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateExternalStorageResponse.t()} | {:error, any()}
  @spec update_external_storage(
          String.t(),
          ExStreamClient.Model.UpdateExternalStorageRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.UpdateExternalStorageResponse.t()} | {:error, any()}
  def update_external_storage(name, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/external_storage/#{name}", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateExternalStorageResponse,
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
  Deletes external storage


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_external_storage(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteExternalStorageResponse.t()} | {:error, any()}
  @spec delete_external_storage(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeleteExternalStorageResponse.t()} | {:error, any()}
  def delete_external_storage(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/external_storage/#{name}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.DeleteExternalStorageResponse,
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
