defmodule ExStreamClient.Chat.QueryBannedUsers do
  @moduledoc "
	Modules for interacting with the `chat/query_banned_users` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/query_banned_users
	"
  require Logger
  @doc ~S"
	Query Banned Users
	
	### Required Arguments:
		
	### Optional Arguments:
		- `payload`: QueryBannedUsersPayload
	"
  @spec query_banned_users() ::
          {:ok, ExStreamClient.Model.QueryBannedUsersResponse.t()} | {:error, any()}
  @spec query_banned_users(payload: ExStreamClient.Model.QueryBannedUsersPayload.t()) ::
          {:ok, ExStreamClient.Model.QueryBannedUsersResponse.t()} | {:error, any()}
  def query_banned_users(opts \\ []) do
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
