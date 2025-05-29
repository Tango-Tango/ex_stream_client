defmodule ExStreamClient.CheckPush do
  @moduledoc "
	Modules for interacting with the `check_push` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/check_push
	"
  require Logger
  @doc ~S"
	Check push
	
	### Required Arguments:
		- `payload`: CheckPushRequest
	"
  @spec check_push(ExStreamClient.Model.CheckPushRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckPushResponse.t()} | {:error, any()}
  def check_push(payload) do
    request_opts = [url: "/api/v2/check_push", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "CheckPushResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end