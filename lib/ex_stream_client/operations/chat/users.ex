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
      [url: "/api/v2/chat/users/#{user_id}/event", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end