defmodule ExStreamClient.Operations.Imports do
  @moduledoc ~S"""
  Modules for interacting with the `imports` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Gets an import


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_import(String.t()) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  @spec get_import(String.t(), client: module()) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  def get_import(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports/#{id}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetImportResponse,
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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Creates a new import


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateImportRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  def create_import(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateImportResponse,
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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Gets an import


  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec list_imports() :: {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  @spec list_imports(client: module()) ::
          {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  def list_imports(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/imports", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListImportsResponse,
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

    case client.request(r, opts) do
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
end
