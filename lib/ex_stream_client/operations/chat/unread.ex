defmodule ExStreamClient.Chat.Unread do
  @moduledoc "
	Modules for interacting with the `chat/unread` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/unread
	"
  require Logger
  @doc ~S"
	Unread counts
	
	### Required Arguments:
		
	"
  @spec unread_counts() ::
          {:ok, ExStreamClient.Model.WrappedUnreadCountsResponse.t()} | {:error, any()}
  def unread_counts() do
    request_opts =
      [url: "/api/v2/chat/unread", method: :get, params: [], decode_json: [keys: :atoms]] ++ []

    response_handlers = %{
      200 => ExStreamClient.Model.WrappedUnreadCountsResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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
