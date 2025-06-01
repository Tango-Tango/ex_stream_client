defmodule ExStreamClient.Operations.Og do
  @moduledoc "
	Modules for interacting with the `og` group of Stream APIs

	API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
	"
  require Logger
  @doc ~S"
	Get an OpenGraph attachment for a link

	
	### Required Arguments:
		- `url`
	"
  @spec get_og(String.t()) :: {:ok, ExStreamClient.Model.GetOGResponse.t()} | {:error, any()}
  def get_og(url) do
    request_opts = [url: "/api/v2/og", method: :get, params: [url: url]] ++ []

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
            200 => ExStreamClient.Model.GetOGResponse,
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
