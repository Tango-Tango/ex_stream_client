defmodule ExStreamClient.Operations.Chat.Messages do
  @moduledoc ~S"""
  Modules for interacting with the `chat/messages` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Delete a vote from a poll

  ### Sends events:
  - `poll.vote_removed`


  ### Required Arguments:
  - `message_id`
  - `poll_id`
  - `vote_id`
  ### Optional Arguments:
  - `user_id`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec remove_poll_vote(String.t(), String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  @spec remove_poll_vote(String.t(), String.t(), String.t(), [
          {:client, module()} | {:user_id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def remove_poll_vote(message_id, poll_id, vote_id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote/#{vote_id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
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
            200 => ExStreamClient.Model.PollVoteResponse,
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

  @doc ~S"""
  Removes user reaction from the message

  ### Sends events:
  - `reaction.deleted`


  ### Required Arguments:
  - `id`
  - `type`
  ### Optional Arguments:
  - `user_id`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_reaction(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  @spec delete_reaction(String.t(), String.t(), [{:client, module()} | {:user_id, String.t()}]) ::
          {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  def delete_reaction(id, type, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reaction/#{type}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
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
            200 => ExStreamClient.Model.DeleteReactionResponse,
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

  @doc ~S"""
  Sends reaction to specified message

  ### Sends events:
  - `reaction.new`
  - `reaction.updated`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.SendReactionRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec send_reaction(String.t(), ExStreamClient.Model.SendReactionRequest.t()) ::
          {:ok, ExStreamClient.Model.SendReactionResponse.t()} | {:error, any()}
  @spec send_reaction(String.t(), ExStreamClient.Model.SendReactionRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.SendReactionResponse.t()} | {:error, any()}
  def send_reaction(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/reaction", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.SendReactionResponse,
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

  @doc ~S"""
  Executes message command action with given parameters

  ### Sends events:
  - `message.new`
  - `message.new`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.MessageActionRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec run_message_action(String.t(), ExStreamClient.Model.MessageActionRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  @spec run_message_action(String.t(), ExStreamClient.Model.MessageActionRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def run_message_action(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/action", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"""
  Queries history for one message


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryMessageHistoryRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_message_history(ExStreamClient.Model.QueryMessageHistoryRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryMessageHistoryResponse.t()} | {:error, any()}
  @spec query_message_history(ExStreamClient.Model.QueryMessageHistoryRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.QueryMessageHistoryResponse.t()} | {:error, any()}
  def query_message_history(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/history", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryMessageHistoryResponse,
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

  @doc ~S"""
  Cast a vote on a poll

  ### Sends events:
  - `poll.vote_casted`


  ### Required Arguments:
  - `message_id`
  - `poll_id`
  - `payload`: `Elixir.ExStreamClient.Model.CastPollVoteRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec cast_poll_vote(String.t(), String.t(), ExStreamClient.Model.CastPollVoteRequest.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  @spec cast_poll_vote(String.t(), String.t(), ExStreamClient.Model.CastPollVoteRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def cast_poll_vote(message_id, poll_id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote",
        method: :post,
        params: []
      ] ++ [json: payload]

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
            201 => ExStreamClient.Model.PollVoteResponse,
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

  @doc ~S"""
  Get reactions on a message


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.QueryReactionsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_reactions(String.t(), ExStreamClient.Model.QueryReactionsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryReactionsResponse.t()} | {:error, any()}
  @spec query_reactions(String.t(), ExStreamClient.Model.QueryReactionsRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.QueryReactionsResponse.t()} | {:error, any()}
  def query_reactions(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/reactions", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryReactionsResponse,
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

  @doc ~S"""
  Returns list of reactions of specific message


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `limit`
  - `offset`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_reactions(String.t()) ::
          {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  @spec get_reactions(String.t(), [
          {:client, module()} | {:offset, integer()} | {:limit, integer()}
        ]) :: {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  def get_reactions(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}/reactions",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:limit, :offset]))
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
            200 => ExStreamClient.Model.GetReactionsResponse,
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

  @doc ~S"""
  Returns replies (thread) of the message


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
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_replies(String.t()) ::
          {:ok, ExStreamClient.Model.GetRepliesResponse.t()} | {:error, any()}
  @spec get_replies(String.t(), [
          {:client, module()}
          | {:created_at_around, float()}
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
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

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
            200 => ExStreamClient.Model.GetRepliesResponse,
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

  @doc ~S"""
  Undelete a message that was previously soft-deleted

  ### Sends events:
  - `message.undeleted`
  - `message.undeleted`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateMessageRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec undelete_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  @spec undelete_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def undelete_message(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/undelete", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateMessageResponse,
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

  @doc ~S"""
  Translates message to a given language using automated translation software

  ### Sends events:
  - `message.updated`
  - `message.updated`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.TranslateMessageRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec translate_message(String.t(), ExStreamClient.Model.TranslateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  @spec translate_message(String.t(), ExStreamClient.Model.TranslateMessageRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def translate_message(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/translate", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"""
  Commits a pending message, which will make it visible in the channel

  ### Sends events:
  - `message.new`
  - `message.updated`
  - `message.new`
  - `message.updated`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.CommitMessageRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec commit_message(String.t(), ExStreamClient.Model.CommitMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  @spec commit_message(String.t(), ExStreamClient.Model.CommitMessageRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def commit_message(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/commit", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.MessageResponse,
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

  @doc ~S"""
  Updates certain fields of the message

  ### Sends events:
  - `message.updated`
  - `message.updated`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateMessagePartialRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec update_message_partial(String.t(), ExStreamClient.Model.UpdateMessagePartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessagePartialResponse.t()} | {:error, any()}
  @spec update_message_partial(String.t(), ExStreamClient.Model.UpdateMessagePartialRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.UpdateMessagePartialResponse.t()} | {:error, any()}
  def update_message_partial(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}", method: :put, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateMessagePartialResponse,
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

  @doc ~S"""
  Updates message with new data

  ### Sends events:
  - `message.updated`
  - `message.updated`


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateMessageRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec update_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  @spec update_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def update_message(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/messages/#{id}", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateMessageResponse,
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

  @doc ~S"""
  Returns message by ID


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `show_deleted_message`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_message(String.t()) ::
          {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  @spec get_message(String.t(), [{:client, module()} | {:show_deleted_message, boolean()}]) ::
          {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  def get_message(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:show_deleted_message]))
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
            200 => ExStreamClient.Model.GetMessageResponse,
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

  @doc ~S"""
  Deletes message

  ### Sends events:
  - `message.deleted`
  - `message.deleted`


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `hard`
  - `deleted_by`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_message(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  @spec delete_message(String.t(), [
          {:client, module()} | {:deleted_by, String.t()} | {:hard, boolean()}
        ]) :: {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  def delete_message(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/messages/#{id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:hard, :deleted_by]))
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
            200 => ExStreamClient.Model.DeleteMessageResponse,
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
