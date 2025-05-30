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
      [url: "/api/v2/chat/drafts/query", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QueryDraftsResponse,
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
