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
      [
        url: "/api/v2/chat/export_channels",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.ExportChannelsResponse,
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
