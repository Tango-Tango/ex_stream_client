defmodule ExStreamClient.Operations.Chat.UnreadBatch do
  @moduledoc "
	Modules for interacting with the `chat/unread_batch` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/unread_batch
	"
  require Logger
  @doc ~S"
	Fetch unread counts in batch for multiple users in one call

	
	### Required Arguments:
		- `payload`: UnreadCountsBatchRequest
	"
  @spec unread_counts_batch(ExStreamClient.Model.UnreadCountsBatchRequest.t()) ::
          {:ok, ExStreamClient.Model.UnreadCountsBatchResponse.t()} | {:error, any()}
  def unread_counts_batch(payload) do
    request_opts =
      [url: "/api/v2/chat/unread_batch", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UnreadCountsBatchResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
