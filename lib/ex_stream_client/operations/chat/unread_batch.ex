defmodule ExStreamClient.Chat.UnreadBatch do
  @moduledoc "
	Modules for interacting with the `chat/unread_batch` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/unread_batch
	"
  require Logger
  @doc ~S"
	Batch unread counts
	
	### Required Arguments:
		- `payload`: UnreadCountsBatchRequest
	"
  @spec unread_counts_batch(ExStreamClient.Model.UnreadCountsBatchRequest.t()) ::
          {:ok, ExStreamClient.Model.UnreadCountsBatchResponse.t()} | {:error, any()}
  def unread_counts_batch(payload) do
    request_opts =
      [url: "/api/v2/chat/unread_batch", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UnreadCountsBatchResponse"}
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