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
    request_opts = [url: "/api/v2/guest", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateGuestResponse,
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
