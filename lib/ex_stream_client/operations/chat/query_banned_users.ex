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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QueryBannedUsersResponse"}
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