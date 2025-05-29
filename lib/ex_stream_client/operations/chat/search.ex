defmodule ExStreamClient.Chat.Search do
  @moduledoc "
	Modules for interacting with the `chat/search` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/search
	"
  require Logger
  @doc ~S"
	Search messages
	
	### Required Arguments:
		
	### Optional Arguments:
		- `payload`: SearchPayload
	"
  @spec search() :: {:ok, ExStreamClient.Model.SearchResponse.t()} | {:error, any()}
  @spec search(payload: ExStreamClient.Model.SearchPayload.t()) ::
          {:ok, ExStreamClient.Model.SearchResponse.t()} | {:error, any()}
  def search(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/search",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "SearchResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end