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
    request_opts = [url: "/api/v2/export/users", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ExportUsersResponse"}
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