defmodule ExStreamClient.Operations.Chat.Drafts do
  @moduledoc ~S"""
  Modules for interacting with the `chat/drafts` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Queries draft messages for a user


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryDraftsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_drafts(ExStreamClient.Model.QueryDraftsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryDraftsResponse.t()} | {:error, any()}
  @spec query_drafts(ExStreamClient.Model.QueryDraftsRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.QueryDraftsResponse.t()} | {:error, any()}
  def query_drafts(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/drafts/query", method: :post, params: []] ++ [json: payload]

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

          response_handlers = %{
            201 => ExStreamClient.Model.QueryDraftsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end
end
