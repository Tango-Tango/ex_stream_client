defmodule ExStreamClient.Operations.CheckSns do
  @moduledoc ~S"""
  Modules for interacting with the `check_sns` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Validates Amazon SNS configuration


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CheckSNSRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec check_sns(ExStreamClient.Model.CheckSNSRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckSNSResponse.t()} | {:error, any()}
  @spec check_sns(ExStreamClient.Model.CheckSNSRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.CheckSNSResponse.t()} | {:error, any()}
  def check_sns(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts = [url: "/api/v2/check_sns", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CheckSNSResponse,
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
end
