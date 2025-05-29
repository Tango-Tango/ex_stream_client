defmodule ExStreamClient.Chat.Threads do
  @moduledoc "
	Modules for interacting with the `chat/threads` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/threads
	"
  require Logger
  @doc ~S"
	Partially update thread
	
	### Required Arguments:
		- `message_id`
		- `payload`: UpdateThreadPartialRequest
	"
  @spec update_thread_partial(String.t(), ExStreamClient.Model.UpdateThreadPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateThreadPartialResponse.t()} | {:error, any()}
  def update_thread_partial(message_id, payload) do
    request_opts =
      [url: "/api/v2/chat/threads/#{message_id}", method: :patch, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpdateThreadPartialResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get Thread
	
	### Required Arguments:
		- `message_id`
	### Optional Arguments:
		- `reply_limit`
		- `participant_limit`
		- `member_limit`
	"
  @spec get_thread(String.t()) ::
          {:ok, ExStreamClient.Model.GetThreadResponse.t()} | {:error, any()}
  @spec get_thread(String.t(), [
          {:member_limit, integer()} | {:participant_limit, integer()} | {:reply_limit, integer()}
        ]) :: {:ok, ExStreamClient.Model.GetThreadResponse.t()} | {:error, any()}
  def get_thread(message_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/threads/#{message_id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:reply_limit, :participant_limit, :member_limit]))
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
                Codegen.convert_response({:ok, response.body}, {:component, "GetThreadResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Query Threads
	
	### Required Arguments:
		- `payload`: QueryThreadsRequest
	"
  @spec query_threads(ExStreamClient.Model.QueryThreadsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryThreadsResponse.t()} | {:error, any()}
  def query_threads(payload) do
    request_opts = [url: "/api/v2/chat/threads", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QueryThreadsResponse"}
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