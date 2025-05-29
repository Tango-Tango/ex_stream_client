defmodule ExStreamClient.Chat.PushPreferences do
  @moduledoc "
	Modules for interacting with the `chat/push_preferences` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/push_preferences
	"
  require Logger
  @doc ~S"
	Push notification preferences
	
	### Required Arguments:
		- `payload`: UpsertPushPreferencesRequest
	"
  @spec update_push_notification_preferences(
          ExStreamClient.Model.UpsertPushPreferencesRequest.t()
        ) :: {:ok, ExStreamClient.Model.UpsertPushPreferencesResponse.t()} | {:error, any()}
  def update_push_notification_preferences(payload) do
    request_opts =
      [url: "/api/v2/chat/push_preferences", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpsertPushPreferencesResponse"}
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