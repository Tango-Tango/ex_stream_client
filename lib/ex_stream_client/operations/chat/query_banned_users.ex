defmodule ExStreamClient.Operations.Chat.QueryBannedUsers do
  @moduledoc ~S"""
  Modules for interacting with the `chat/query_banned_users` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Find and filter channel scoped or global user bans


  ### Optional Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryBannedUsersPayload`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_banned_users() ::
          {:ok, ExStreamClient.Model.QueryBannedUsersResponse.t()} | {:error, any()}
  @spec query_banned_users([
          {:client, module()} | {:payload, ExStreamClient.Model.QueryBannedUsersPayload.t()}
        ]) :: {:ok, ExStreamClient.Model.QueryBannedUsersResponse.t()} | {:error, any()}
  def query_banned_users(opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/query_banned_users",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

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
            200 => ExStreamClient.Model.QueryBannedUsersResponse,
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
end
