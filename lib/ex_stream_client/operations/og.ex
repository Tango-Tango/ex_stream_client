defmodule ExStreamClient.Og do
  @moduledoc "
	Modules for interacting with the `og` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/og
	"
  require Logger
  @doc ~S"
	Get OG
	
	### Required Arguments:
		- `url`
	"
  @spec get_og(String.t()) :: {:ok, ExStreamClient.Model.GetOGResponse.t()} | {:error, any()}
  def get_og(url) do
    request_opts = [url: "/api/v2/og", method: :get, params: [url: url] |> Map.new()] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "GetOGResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end