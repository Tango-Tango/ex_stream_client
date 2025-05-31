defmodule ExStreamClient.Operations.Chat.PushPreferences do
  @moduledoc "
	Modules for interacting with the `chat/push_preferences` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/push_preferences
	"
  require Logger
  @doc ~S"
	Update the push preferences for a user and or channel member. Set to all, mentions or none

	
	### Required Arguments:
		- `payload`: UpsertPushPreferencesRequest
	"
  @spec update_push_notification_preferences(
          ExStreamClient.Model.UpsertPushPreferencesRequest.t()
        ) :: {:ok, ExStreamClient.Model.UpsertPushPreferencesResponse.t()} | {:error, any()}
  def update_push_notification_preferences(payload) do
    request_opts =
      [url: "/api/v2/chat/push_preferences", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpsertPushPreferencesResponse,
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
