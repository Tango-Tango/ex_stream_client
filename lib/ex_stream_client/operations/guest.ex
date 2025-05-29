defmodule ExStreamClient.Guest do
  @moduledoc "
	Modules for interacting with the `guest` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/guest
	"
  require Logger
  @doc ~S"
	Create Guest
	
	### Required Arguments:
		- `payload`: CreateGuestRequest
	"
  @spec create_guest(ExStreamClient.Model.CreateGuestRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateGuestResponse.t()} | {:error, any()}
  def create_guest(payload) do
    request_opts = [url: "/api/v2/guest", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateGuestResponse"}
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