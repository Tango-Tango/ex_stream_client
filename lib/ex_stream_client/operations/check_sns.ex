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
    request_opts = [url: "/api/v2/check_sns", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "CheckSNSResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end