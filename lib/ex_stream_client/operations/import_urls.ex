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
    request_opts = [url: "/api/v2/import_urls", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateImportURLResponse"}
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