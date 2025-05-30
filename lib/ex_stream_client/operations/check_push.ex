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
    request_opts =
      [url: "/api/v2/check_push", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CheckPushResponse,
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
