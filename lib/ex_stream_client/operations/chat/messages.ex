defmodule ExStreamClient.Chat.Messages do
  @moduledoc "
	Modules for interacting with the `chat/messages` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/messages
	"
  require Logger
  @doc ~S"
	Delete vote
	
	### Required Arguments:
		- `message_id`
		- `poll_id`
		- `vote_id`
	### Optional Arguments:
		- `user_id`
	"
  @spec remove_poll_vote(String.t(), String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  @spec remove_poll_vote(String.t(), String.t(), String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def remove_poll_vote(message_id, poll_id, vote_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote/#{vote_id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.PollVoteResponse,
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

  @doc ~S"
	Delete reaction
	
	### Required Arguments:
		- `id`
		- `type`
	### Optional Arguments:
		- `user_id`
	"
  @spec delete_reaction(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  @spec delete_reaction(String.t(), String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  def delete_reaction(id, type, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reaction/#{type}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.DeleteReactionResponse,
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

  @doc ~S"
	Send reaction
	
	### Required Arguments:
		- `id`
		- `payload`: SendReactionRequest
	"
  @spec send_reaction(String.t(), ExStreamClient.Model.SendReactionRequest.t()) ::
          {:ok, ExStreamClient.Model.SendReactionResponse.t()} | {:error, any()}
  def send_reaction(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reaction",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.SendReactionResponse,
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

  @doc ~S"
	Run message command action
	
	### Required Arguments:
		- `id`
		- `payload`: MessageActionRequest
	"
  @spec run_message_action(String.t(), ExStreamClient.Model.MessageActionRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def run_message_action(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/action",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"
	Query message history
	
	### Required Arguments:
		- `payload`: QueryMessageHistoryRequest
	"
  @spec query_message_history(ExStreamClient.Model.QueryMessageHistoryRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryMessageHistoryResponse.t()} | {:error, any()}
  def query_message_history(payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/history",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QueryMessageHistoryResponse,
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

  @doc ~S"
	Cast vote
	
	### Required Arguments:
		- `message_id`
		- `poll_id`
		- `payload`: CastPollVoteRequest
	"
  @spec cast_poll_vote(String.t(), String.t(), ExStreamClient.Model.CastPollVoteRequest.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def cast_poll_vote(message_id, poll_id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollVoteResponse,
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

  @doc ~S"
	
	
	### Required Arguments:
		- `id`
		- `payload`: QueryReactionsRequest
	"
  @spec query_reactions(String.t(), ExStreamClient.Model.QueryReactionsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryReactionsResponse.t()} | {:error, any()}
  def query_reactions(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reactions",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QueryReactionsResponse,
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

  @doc ~S"
	Get reactions
	
	### Required Arguments:
		- `id`
	### Optional Arguments:
		- `limit`
		- `offset`
	"
  @spec get_reactions(String.t()) ::
          {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  @spec get_reactions(String.t(), [{:offset, integer()} | {:limit, integer()}]) ::
          {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  def get_reactions(id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reactions",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:limit, :offset]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetReactionsResponse,
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

  @doc ~S"
	Get replies
	
	### Required Arguments:
		- `parent_id`
	### Optional Arguments:
		- `sort`
		- `limit`
		- `offset`
		- `id_gte`
		- `id_gt`
		- `id_lte`
		- `id_lt`
		- `created_at_after_or_equal`
		- `created_at_after`
		- `created_at_before_or_equal`
		- `created_at_before`
		- `id_around`
		- `created_at_around`
	"
  @spec get_replies(String.t()) ::
          {:ok, ExStreamClient.Model.GetRepliesResponse.t()} | {:error, any()}
  @spec get_replies(String.t(), [
          {:created_at_around, float()}
          | {:id_around, String.t()}
          | {:created_at_before, float()}
          | {:created_at_before_or_equal, float()}
          | {:created_at_after, float()}
          | {:created_at_after_or_equal, float()}
          | {:id_lt, String.t()}
          | {:id_lte, String.t()}
          | {:id_gt, String.t()}
          | {:id_gte, String.t()}
          | {:offset, integer()}
          | {:limit, integer()}
          | {:sort, list()}
        ]) :: {:ok, ExStreamClient.Model.GetRepliesResponse.t()} | {:error, any()}
  def get_replies(parent_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{parent_id}/replies",
        method: :get,
        params:
          Keyword.merge(
            [],
            Keyword.take(opts, [
              :sort,
              :limit,
              :offset,
              :id_gte,
              :id_gt,
              :id_lte,
              :id_lt,
              :created_at_after_or_equal,
              :created_at_after,
              :created_at_before_or_equal,
              :created_at_before,
              :id_around,
              :created_at_around
            ])
          )
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetRepliesResponse,
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

  @doc ~S"
	Undelete message
	
	### Required Arguments:
		- `id`
		- `payload`: UpdateMessageRequest
	"
  @spec undelete_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def undelete_message(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/undelete",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateMessageResponse,
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

  @doc ~S"
	Translate message
	
	### Required Arguments:
		- `id`
		- `payload`: TranslateMessageRequest
	"
  @spec translate_message(String.t(), ExStreamClient.Model.TranslateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def translate_message(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/translate",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"
	Commit message
	
	### Required Arguments:
		- `id`
		- `payload`: CommitMessageRequest
	"
  @spec commit_message(String.t(), ExStreamClient.Model.CommitMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def commit_message(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/commit",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"
	Partially message update
	
	### Required Arguments:
		- `id`
		- `payload`: UpdateMessagePartialRequest
	"
  @spec update_message_partial(String.t(), ExStreamClient.Model.UpdateMessagePartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessagePartialResponse.t()} | {:error, any()}
  def update_message_partial(id, payload) do
    request_opts =
      [url: "/api/v2/chat/messages/#{id}", method: :put, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateMessagePartialResponse,
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

  @doc ~S"
	Update message
	
	### Required Arguments:
		- `id`
		- `payload`: UpdateMessageRequest
	"
  @spec update_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def update_message(id, payload) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateMessageResponse,
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

  @doc ~S"
	Get message
	
	### Required Arguments:
		- `id`
	### Optional Arguments:
		- `show_deleted_message`
	"
  @spec get_message(String.t()) ::
          {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  @spec get_message(String.t(), show_deleted_message: boolean()) ::
          {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  def get_message(id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:show_deleted_message]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetMessageResponse,
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

  @doc ~S"
	Delete message
	
	### Required Arguments:
		- `id`
	### Optional Arguments:
		- `hard`
		- `deleted_by`
	"
  @spec delete_message(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  @spec delete_message(String.t(), [{:deleted_by, String.t()} | {:hard, boolean()}]) ::
          {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  def delete_message(id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:hard, :deleted_by]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.DeleteMessageResponse,
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
