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
    request_opts = [url: "/api/v2/chat/unread", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "WrappedUnreadCountsResponse"}
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