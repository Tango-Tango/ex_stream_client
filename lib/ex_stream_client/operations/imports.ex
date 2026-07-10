defmodule ExStreamClient.Operations.Imports do
  @moduledoc ~S"""
  Modules for interacting with the `imports` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `authenticate_as_user` - User id to authenticate. If not provided, the server key will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
   * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options
  """
  require Logger

  @type shared_opts :: [
          api_key: String.t(),
          api_key_secret: String.t(),
          authenticate_as_user: String.t(),
          client: module(),
          endpoint: String.t(),
          req_opts: keyword()
        ]
  @doc ~S"""
  Gets a single import v2 task by ID


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_import_v2_task(String.t()) ::
          {:ok, ExStreamClient.Model.GetImportV2TaskResponse.t()} | {:error, any()}
  @spec get_import_v2_task(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.GetImportV2TaskResponse.t()} | {:error, any()}
  def get_import_v2_task(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/v2/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetImportV2TaskResponse,
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
  Deletes an import v2 task. Can only delete tasks in queued state.


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_import_v2_task(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteImportV2TaskResponse.t()} | {:error, any()}
  @spec delete_import_v2_task(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeleteImportV2TaskResponse.t()} | {:error, any()}
  def delete_import_v2_task(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/v2/#{id}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.DeleteImportV2TaskResponse,
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
  Gets an import


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_import(String.t()) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  @spec get_import(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  def get_import(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetImportResponse,
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
  Validates the configured external S3 storage by performing a live STS AssumeRole and S3 ListObjectsV2 check.


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec validate_importer_external_storage() ::
          {:ok, ExStreamClient.Model.ValidateExternalStorageResponse.t()} | {:error, any()}
  @spec validate_importer_external_storage(shared_opts) ::
          {:ok, ExStreamClient.Model.ValidateExternalStorageResponse.t()} | {:error, any()}
  def validate_importer_external_storage(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/imports/v2/external-storage/validate", method: :post, params: []] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.ValidateExternalStorageResponse,
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
  Creates or updates the external storage configuration for the app. Currently only AWS S3 (via cross-account IAM role assumption) is supported.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertExternalStorageRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec upsert_importer_external_storage(ExStreamClient.Model.UpsertExternalStorageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertExternalStorageResponse.t()} | {:error, any()}
  @spec upsert_importer_external_storage(
          ExStreamClient.Model.UpsertExternalStorageRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.UpsertExternalStorageResponse.t()} | {:error, any()}
  def upsert_importer_external_storage(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/imports/v2/external-storage", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UpsertExternalStorageResponse,
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
  Returns the current external storage configuration for the app. Returns 404 if no configuration exists.


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_importer_external_storage() ::
          {:ok, ExStreamClient.Model.GetExternalStorageResponse.t()} | {:error, any()}
  @spec get_importer_external_storage(shared_opts) ::
          {:ok, ExStreamClient.Model.GetExternalStorageResponse.t()} | {:error, any()}
  def get_importer_external_storage(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/v2/external-storage", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetExternalStorageResponse,
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
  Removes the external storage configuration for the app. Idempotent: succeeds even if no configuration exists.


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_importer_external_storage() ::
          {:ok, ExStreamClient.Model.DeleteExternalStorageResponse.t()} | {:error, any()}
  @spec delete_importer_external_storage(shared_opts) ::
          {:ok, ExStreamClient.Model.DeleteExternalStorageResponse.t()} | {:error, any()}
  def delete_importer_external_storage(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/v2/external-storage", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.DeleteExternalStorageResponse,
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
  Creates a new import v2 task


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateImportV2TaskRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_import_v2_task(ExStreamClient.Model.CreateImportV2TaskRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportV2TaskResponse.t()} | {:error, any()}
  @spec create_import_v2_task(ExStreamClient.Model.CreateImportV2TaskRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CreateImportV2TaskResponse.t()} | {:error, any()}
  def create_import_v2_task(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/v2", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.CreateImportV2TaskResponse,
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
  Lists all import v2 tasks for the app


  ### Optional Arguments:
  - `state`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_import_v2_tasks() ::
          {:ok, ExStreamClient.Model.ListImportV2TasksResponse.t()} | {:error, any()}
  @spec list_import_v2_tasks([{:state, integer()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.ListImportV2TasksResponse.t()} | {:error, any()}
  def list_import_v2_tasks(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/imports/v2",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:state]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.ListImportV2TasksResponse,
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
  Creates a new import


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateImportRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  def create_import(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.CreateImportResponse,
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
  Gets an import


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_imports() :: {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  @spec list_imports(shared_opts) ::
          {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  def list_imports(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.ListImportsResponse,
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
    Keyword.take(opts, [:api_key, :api_key_secret, :authenticate_as_user, :endpoint])
  end
end
