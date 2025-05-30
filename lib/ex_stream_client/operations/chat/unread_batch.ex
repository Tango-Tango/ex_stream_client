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
      [url: "/api/v2/chat/unread_batch", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UnreadCountsBatchResponse,
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
