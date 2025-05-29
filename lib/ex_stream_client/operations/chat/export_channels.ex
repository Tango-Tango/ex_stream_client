defmodule ExStreamClient.Chat.ExportChannels do
  @moduledoc "
	Modules for interacting with the `chat/export_channels` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/export_channels
	"
  require Logger
  @doc ~S"
	Export channels
	
	### Required Arguments:
		- `payload`: ExportChannelsRequest
	"
  @spec export_channels(ExStreamClient.Model.ExportChannelsRequest.t()) ::
          {:ok, ExStreamClient.Model.ExportChannelsResponse.t()} | {:error, any()}
  def export_channels(payload) do
    request_opts =
      [url: "/api/v2/chat/export_channels", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ExportChannelsResponse"}
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