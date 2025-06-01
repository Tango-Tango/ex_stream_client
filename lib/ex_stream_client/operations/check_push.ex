defmodule ExStreamClient.Operations.CheckPush do
  @moduledoc "
	Modules for interacting with the `check_push` group of Stream APIs

	API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
	"
  require Logger
  @doc ~S"
	Sends a test message via push, this is a test endpoint to verify your push settings

	
	### Required Arguments:
		- `payload`: CheckPushRequest
	"
  @spec check_push(ExStreamClient.Model.CheckPushRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckPushResponse.t()} | {:error, any()}
  def check_push(payload) do
    request_opts = [url: "/api/v2/check_push", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CheckPushResponse,
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
