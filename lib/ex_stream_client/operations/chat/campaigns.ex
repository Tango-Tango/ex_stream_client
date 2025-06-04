defmodule ExStreamClient.Operations.Chat.Campaigns do
  @moduledoc ~S"""
  Modules for interacting with the `chat/campaigns` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Stops a campaign


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.StopCampaignRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec schedule_campaign(String.t(), ExStreamClient.Model.StopCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.CampaignResponse.t()} | {:error, any()}
  @spec schedule_campaign(String.t(), ExStreamClient.Model.StopCampaignRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.CampaignResponse.t()} | {:error, any()}
  def schedule_campaign(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/#{id}/stop", method: :post, params: []] ++ [json: payload]

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Query campaigns with filter query


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryCampaignsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_campaigns(ExStreamClient.Model.QueryCampaignsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryCampaignsResponse.t()} | {:error, any()}
  @spec query_campaigns(ExStreamClient.Model.QueryCampaignsRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.QueryCampaignsResponse.t()} | {:error, any()}
  def query_campaigns(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/query", method: :post, params: []] ++ [json: payload]

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Get campaign by ID.


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `prev`
  - `next`
  - `limit`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_campaign(String.t()) ::
          {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  @spec get_campaign(String.t(), [
          {:client, module()} | {:limit, integer()} | {:next, String.t()} | {:prev, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  def get_campaign(id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/campaigns/#{id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:prev, :next, :limit]))
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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Starts or schedules a campaign


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.StartCampaignRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec start_campaign(String.t(), ExStreamClient.Model.StartCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.StartCampaignResponse.t()} | {:error, any()}
  @spec start_campaign(String.t(), ExStreamClient.Model.StartCampaignRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.StartCampaignResponse.t()} | {:error, any()}
  def start_campaign(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/campaigns/#{id}/start", method: :post, params: []] ++ [json: payload]

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
