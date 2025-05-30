defmodule ExStreamClient.CheckSns do
  @moduledoc "
	Modules for interacting with the `check_sns` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/check_sns
	"
  require Logger
  @doc ~S"
	Check SNS
	
	### Required Arguments:
		- `payload`: CheckSNSRequest
	"
  @spec check_sns(ExStreamClient.Model.CheckSNSRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckSNSResponse.t()} | {:error, any()}
  def check_sns(payload) do
    request_opts =
      [url: "/api/v2/check_sns", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CheckSNSResponse,
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
