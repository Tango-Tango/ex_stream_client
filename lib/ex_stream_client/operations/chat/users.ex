defmodule ExStreamClient.Chat.Users do
  @moduledoc "
	Modules for interacting with the `chat/users` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/users
	"
  require Logger
  @doc ~S"
	Send user event
	
	### Required Arguments:
		- `user_id`
		- `payload`: SendUserCustomEventRequest
	"
  @spec send_user_custom_event(String.t(), ExStreamClient.Model.SendUserCustomEventRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def send_user_custom_event(user_id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/users/#{user_id}/event",
        method: :post,
        params: [],
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    response_handlers = %{
      201 => ExStreamClient.Model.Response,
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
