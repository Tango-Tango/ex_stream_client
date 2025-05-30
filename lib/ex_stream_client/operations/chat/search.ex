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
          |> Enum.reject(fn {_k, v} -> is_nil(v) end),
        decode_json: [keys: :atoms]
      ] ++ []

    response_handlers = %{
      200 => ExStreamClient.Model.SearchResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_type =
            if response.status in 200..299 do
              :ok
            else
              :error
            end

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
