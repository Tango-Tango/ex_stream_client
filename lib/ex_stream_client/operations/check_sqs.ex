defmodule ExStreamClient.CheckSqs do
  @moduledoc "
	Modules for interacting with the `check_sqs` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/check_sqs
	"
  require Logger
  @doc ~S"
	Check SQS
	
	### Required Arguments:
		- `payload`: CheckSQSRequest
	"
  @spec check_sqs(ExStreamClient.Model.CheckSQSRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckSQSResponse.t()} | {:error, any()}
  def check_sqs(payload) do
    request_opts = [url: "/api/v2/check_sqs", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "CheckSQSResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end