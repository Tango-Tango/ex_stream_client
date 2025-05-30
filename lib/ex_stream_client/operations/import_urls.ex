defmodule ExStreamClient.ImportUrls do
  @moduledoc "
	Modules for interacting with the `import_urls` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/import_urls
	"
  require Logger
  @doc ~S"
	Create import URL
	
	### Required Arguments:
		- `payload`: CreateImportURLRequest
	"
  @spec create_import_url(ExStreamClient.Model.CreateImportURLRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportURLResponse.t()} | {:error, any()}
  def create_import_url(payload) do
    request_opts =
      [url: "/api/v2/import_urls", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateImportURLResponse,
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
