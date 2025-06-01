defmodule ExStreamClient.Operations.App do
  @moduledoc "
	Modules for interacting with the `app` group of Stream APIs

	API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
	"
  require Logger
  @doc ~S"
	This Method updates one or more application settings

	
	### Required Arguments:
		- `payload`: UpdateAppRequest
	"
  @spec update_app(ExStreamClient.Model.UpdateAppRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def update_app(payload) do
    request_opts = [url: "/api/v2/app", method: :patch, params: []] ++ [json: payload]

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
            200 => ExStreamClient.Model.Response,
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

  @doc ~S"
	This Method returns the application settings

	
	### Required Arguments:
		
	"
  @spec get_app() :: {:ok, ExStreamClient.Model.GetApplicationResponse.t()} | {:error, any()}
  def get_app() do
    request_opts = [url: "/api/v2/app", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetApplicationResponse,
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
