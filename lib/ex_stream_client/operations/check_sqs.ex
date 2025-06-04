defmodule ExStreamClient.Operations.CheckSqs do
  @moduledoc ~S"""
  Modules for interacting with the `check_sqs` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Validates Amazon SQS credentials


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CheckSQSRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec check_sqs(ExStreamClient.Model.CheckSQSRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckSQSResponse.t()} | {:error, any()}
  @spec check_sqs(ExStreamClient.Model.CheckSQSRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.CheckSQSResponse.t()} | {:error, any()}
  def check_sqs(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/check_sqs", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CheckSQSResponse,
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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end
end
