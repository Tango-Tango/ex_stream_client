defmodule ExStreamClient.Operations.PushProviders do
  @moduledoc ~S"""
  Modules for interacting with the `push_providers` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Delete a push provider from v2 with multi bundle/package support. v1 isn't supported in this endpoint


  ### Required Arguments:
  - `type`
  - `name`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_push_provider(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_push_provider(String.t(), String.t(), client: module()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_push_provider(type, name, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/push_providers/#{type}/#{name}", method: :delete, params: []] ++ []

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Upsert a push provider for v2 with multi bundle/package support


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertPushProviderRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec upsert_push_provider(ExStreamClient.Model.UpsertPushProviderRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertPushProviderResponse.t()} | {:error, any()}
  @spec upsert_push_provider(ExStreamClient.Model.UpsertPushProviderRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.UpsertPushProviderResponse.t()} | {:error, any()}
  def upsert_push_provider(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/push_providers", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpsertPushProviderResponse,
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
  List details of all push providers.


  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec list_push_providers() ::
          {:ok, ExStreamClient.Model.ListPushProvidersResponse.t()} | {:error, any()}
  @spec list_push_providers(client: module()) ::
          {:ok, ExStreamClient.Model.ListPushProvidersResponse.t()} | {:error, any()}
  def list_push_providers(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/push_providers", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListPushProvidersResponse,
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
