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
    request_opts = [url: "/api/v2/app", method: :patch, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get App Settings
	
	### Required Arguments:
		
	"
  @spec get_app() :: {:ok, ExStreamClient.Model.GetApplicationResponse.t()} | {:error, any()}
  def get_app() do
    request_opts = [url: "/api/v2/app", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetApplicationResponse"}
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