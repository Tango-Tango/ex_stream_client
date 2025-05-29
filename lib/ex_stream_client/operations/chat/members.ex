defmodule ExStreamClient.Chat.Members do
  @moduledoc "
	Modules for interacting with the `chat/members` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/members
	"
  require Logger
  @doc ~S"
	Query members
	
	### Required Arguments:
		
	### Optional Arguments:
		- `payload`: QueryMembersPayload
	"
  @spec query_members() :: {:ok, ExStreamClient.Model.MembersResponse.t()} | {:error, any()}
  @spec query_members(payload: ExStreamClient.Model.QueryMembersPayload.t()) ::
          {:ok, ExStreamClient.Model.MembersResponse.t()} | {:error, any()}
  def query_members(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/members",
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
                Codegen.convert_response({:ok, response.body}, {:component, "MembersResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end