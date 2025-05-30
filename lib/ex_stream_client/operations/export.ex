defmodule ExStreamClient.Export do
  @moduledoc "
	Modules for interacting with the `export` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/export
	"
  require Logger
  @doc ~S"
	Export users
	
	### Required Arguments:
		- `payload`: ExportUsersRequest
	"
  @spec export_users(ExStreamClient.Model.ExportUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.ExportUsersResponse.t()} | {:error, any()}
  def export_users(payload) do
    request_opts =
      [url: "/api/v2/export/users", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.ExportUsersResponse,
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
