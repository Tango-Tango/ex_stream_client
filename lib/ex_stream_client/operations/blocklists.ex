defmodule ExStreamClient.Operations.Blocklists do
  @moduledoc ~S"""
  Modules for interacting with the `blocklists` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
  """
  require Logger

  @doc ~S"""
  Creates a new application blocklist, once created the blocklist can be used by any channel type


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateBlockListRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_block_list(ExStreamClient.Model.CreateBlockListRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateBlockListResponse.t()} | {:error, any()}
  def create_block_list(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/blocklists", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateBlockListResponse,
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
  Returns all available block lists


  ### Optional Arguments:
  - `team`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_block_lists() ::
          {:ok, ExStreamClient.Model.ListBlockListResponse.t()} | {:error, any()}
  @spec list_block_lists([
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.ListBlockListResponse.t()} | {:error, any()}
  def list_block_lists(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/blocklists", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListBlockListResponse,
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
  Updates contents of the block list


  ### Required Arguments:
  - `name`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateBlockListRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_block_list(String.t(), ExStreamClient.Model.UpdateBlockListRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateBlockListResponse.t()} | {:error, any()}
  def update_block_list(name, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/blocklists/#{name}", method: :put, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateBlockListResponse,
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
  Returns block list by given name


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - `team`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_block_list(String.t()) ::
          {:ok, ExStreamClient.Model.GetBlockListResponse.t()} | {:error, any()}
  @spec get_block_list(String.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:name, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetBlockListResponse.t()} | {:error, any()}
  def get_block_list(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/blocklists/#{name}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetBlockListResponse,
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
  Deletes previously created application blocklist


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - `team`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_block_list(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_block_list(String.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:name, String.t()}
        ]) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_block_list(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/blocklists/#{name}", method: :delete, params: []] ++ []

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
            200 => ExStreamClient.Model.Response,
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
