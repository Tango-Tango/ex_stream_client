defmodule ExStreamClient.App do
  @moduledoc "
	Modules for interacting with the `app` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/app
	"
  require Logger
  @doc ~S"
	Update App Settings
	
	### Required Arguments:
		- `payload`: UpdateAppRequest
	"
  @spec update_app(ExStreamClient.Model.UpdateAppRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def update_app(payload) do
    request_opts =
      [url: "/api/v2/app", method: :patch, params: [], decode_json: [keys: :atoms]] ++
        [json: payload]

    response_handlers = %{
      200 => ExStreamClient.Model.Response,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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

  @doc ~S"
	Get App Settings
	
	### Required Arguments:
		
	"
  @spec get_app() :: {:ok, ExStreamClient.Model.GetApplicationResponse.t()} | {:error, any()}
  def get_app() do
    request_opts =
      [url: "/api/v2/app", method: :get, params: [], decode_json: [keys: :atoms]] ++ []

    response_handlers = %{
      200 => ExStreamClient.Model.GetApplicationResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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
