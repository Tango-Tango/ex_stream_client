defmodule ExStreamClient.Operations.Uploads do
  @moduledoc ~S"""
  Modules for interacting with the `uploads` group of Stream APIs

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
  Uploads image


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.ImageUploadRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec upload_image_global(ExStreamClient.Model.ImageUploadRequest.t()) ::
          {:ok, ExStreamClient.Model.ImageUploadResponse.t()} | {:error, any()}
  @spec upload_image_global(ExStreamClient.Model.ImageUploadRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.ImageUploadResponse.t()} | {:error, any()}
  def upload_image_global(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/uploads/image", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.ImageUploadResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes previously uploaded image


  ### Optional Arguments:
  - `url`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_image_global() :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_image_global([{:url, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_image_global(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/uploads/image",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:url]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.Response,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Uploads file


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.FileUploadRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec upload_file_global(ExStreamClient.Model.FileUploadRequest.t()) ::
          {:ok, ExStreamClient.Model.FileUploadResponse.t()} | {:error, any()}
  @spec upload_file_global(ExStreamClient.Model.FileUploadRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.FileUploadResponse.t()} | {:error, any()}
  def upload_file_global(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/uploads/file", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.FileUploadResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes previously uploaded file


  ### Optional Arguments:
  - `url`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_file_global() :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_file_global([{:url, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_file_global(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/uploads/file",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:url]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.Response,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
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
