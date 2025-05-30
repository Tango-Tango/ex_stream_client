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
    request_opts =
      [
        url: "/api/v2/og",
        method: :get,
        params: [url: url] |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetOGResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end
end
