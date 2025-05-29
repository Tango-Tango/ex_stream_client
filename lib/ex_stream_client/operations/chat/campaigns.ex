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
      [url: "/api/v2/chat/campaigns/#{id}/stop", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "CampaignResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
      [url: "/api/v2/chat/campaigns/query", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QueryCampaignsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetCampaignResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
      [url: "/api/v2/chat/campaigns/#{id}/start", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "StartCampaignResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end