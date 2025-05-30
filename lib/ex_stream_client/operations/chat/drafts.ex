defmodule ExStreamClient.Chat.Drafts do
  @moduledoc "
	Modules for interacting with the `chat/drafts` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/drafts
	"
  require Logger
  @doc ~S"
	Query draft messages
	
	### Required Arguments:
		- `payload`: QueryDraftsRequest
	"
  @spec query_drafts(ExStreamClient.Model.QueryDraftsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryDraftsResponse.t()} | {:error, any()}
  def query_drafts(payload) do
    request_opts =
      [url: "/api/v2/chat/drafts/query", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryDraftsResponse,
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
