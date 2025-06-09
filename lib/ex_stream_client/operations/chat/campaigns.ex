defmodule ExStreamClient.Operations.Chat.Campaigns do
  @moduledoc ~S"""
  Modules for interacting with the `chat/campaigns` group of Stream APIs

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

  @doc ~S"""
  Stops a campaign


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.StopCampaignRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec schedule_campaign(String.t(), ExStreamClient.Model.StopCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.CampaignResponse.t()} | {:error, any()}
  def schedule_campaign(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/#{id}/stop", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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
            201 => ExStreamClient.Model.CampaignResponse,
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
  Query campaigns with filter query


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryCampaignsRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_campaigns(ExStreamClient.Model.QueryCampaignsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryCampaignsResponse.t()} | {:error, any()}
  def query_campaigns(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/query", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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
            201 => ExStreamClient.Model.QueryCampaignsResponse,
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
  Get campaign by ID.


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `limit`
  - `next`
  - `prev`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_campaign(String.t()) ::
          {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  @spec get_campaign(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  def get_campaign(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/campaigns/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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
            200 => ExStreamClient.Model.GetCampaignResponse,
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
  Starts or schedules a campaign


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.StartCampaignRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec start_campaign(String.t(), ExStreamClient.Model.StartCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.StartCampaignResponse.t()} | {:error, any()}
  def start_campaign(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/#{id}/start", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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
            201 => ExStreamClient.Model.StartCampaignResponse,
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
