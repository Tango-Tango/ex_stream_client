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
      [url: "/api/v2/chat/drafts/query", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QueryDraftsResponse"}
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