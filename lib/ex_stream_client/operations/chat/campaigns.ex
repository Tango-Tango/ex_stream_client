defmodule ExStreamClient.Chat.Campaigns do
  @moduledoc "
	Modules for interacting with the `chat/campaigns` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/campaigns
	"
  require Logger
  @doc ~S"
	Stop campaign
	
	### Required Arguments:
		- `id`
		- `payload`: StopCampaignRequest
	"
  @spec schedule_campaign(String.t(), ExStreamClient.Model.StopCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.CampaignResponse.t()} | {:error, any()}
  def schedule_campaign(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/campaigns/#{id}/stop",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CampaignResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Query campaigns
	
	### Required Arguments:
		- `payload`: QueryCampaignsRequest
	"
  @spec query_campaigns(ExStreamClient.Model.QueryCampaignsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryCampaignsResponse.t()} | {:error, any()}
  def query_campaigns(payload) do
    request_opts =
      [
        url: "/api/v2/chat/campaigns/query",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QueryCampaignsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get campaign
	
	### Required Arguments:
		- `id`
	### Optional Arguments:
		- `prev`
		- `next`
		- `limit`
	"
  @spec get_campaign(String.t()) ::
          {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  @spec get_campaign(String.t(), [{:limit, integer()} | {:next, String.t()} | {:prev, String.t()}]) ::
          {:ok, ExStreamClient.Model.GetCampaignResponse.t()} | {:error, any()}
  def get_campaign(id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/campaigns/#{id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:prev, :next, :limit]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetCampaignResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Start/schedule campaign
	
	### Required Arguments:
		- `id`
		- `payload`: StartCampaignRequest
	"
  @spec start_campaign(String.t(), ExStreamClient.Model.StartCampaignRequest.t()) ::
          {:ok, ExStreamClient.Model.StartCampaignResponse.t()} | {:error, any()}
  def start_campaign(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/campaigns/#{id}/start",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.StartCampaignResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end
end
