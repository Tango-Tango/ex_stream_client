defmodule ExStreamClient.Operations.Chat.Messages do
  @moduledoc ~S"""
  Modules for interacting with the `chat/messages` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
   * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec remove_poll_vote(String.t(), String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  @spec remove_poll_vote(String.t(), String.t(), String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:vote_id, String.t()}
          | {:poll_id, String.t()}
          | {:message_id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def remove_poll_vote(message_id, poll_id, vote_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote/#{vote_id}",
        method: :delete,
        params: []
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_reaction(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  @spec delete_reaction(String.t(), String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:type, String.t()}
          | {:id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.DeleteReactionResponse.t()} | {:error, any()}
  def delete_reaction(id, type, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/reaction/#{type}", method: :delete, params: []] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec send_reaction(String.t(), ExStreamClient.Model.SendReactionRequest.t()) ::
          {:ok, ExStreamClient.Model.SendReactionResponse.t()} | {:error, any()}
  def send_reaction(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/reaction", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec run_message_action(String.t(), ExStreamClient.Model.MessageActionRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def run_message_action(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/action", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Queries history for one message


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryMessageHistoryRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_message_history(ExStreamClient.Model.QueryMessageHistoryRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryMessageHistoryResponse.t()} | {:error, any()}
  def query_message_history(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/history", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec cast_poll_vote(String.t(), String.t(), ExStreamClient.Model.CastPollVoteRequest.t()) ::
          {:ok, ExStreamClient.Model.PollVoteResponse.t()} | {:error, any()}
  def cast_poll_vote(message_id, poll_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/messages/#{message_id}/polls/#{poll_id}/vote",
        method: :post,
        params: []
      ] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Get reactions on a message


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.QueryReactionsRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_reactions(String.t(), ExStreamClient.Model.QueryReactionsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryReactionsResponse.t()} | {:error, any()}
  def query_reactions(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/reactions", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_reactions(String.t()) ::
          {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  @spec get_reactions(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetReactionsResponse.t()} | {:error, any()}
  def get_reactions(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/messages/#{id}/reactions", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Returns replies (thread) of the message


  ### Required Arguments:
  - `parent_id`
  ### Optional Arguments:
  - `created_at_after`
  - `created_at_after_or_equal`
  - `created_at_around`
  - `created_at_before`
  - `created_at_before_or_equal`
  - `id_around`
  - `id_gt`
  - `id_gte`
  - `id_lt`
  - `id_lte`
  - `limit`
  - `offset`
  - `sort`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_replies(String.t()) ::
          {:ok, ExStreamClient.Model.GetRepliesResponse.t()} | {:error, any()}
  @spec get_replies(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:parent_id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetRepliesResponse.t()} | {:error, any()}
  def get_replies(parent_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{parent_id}/replies", method: :get, params: []] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec undelete_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def undelete_message(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/undelete", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec translate_message(String.t(), ExStreamClient.Model.TranslateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def translate_message(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/translate", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec commit_message(String.t(), ExStreamClient.Model.CommitMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.MessageResponse.t()} | {:error, any()}
  def commit_message(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}/commit", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_message_partial(String.t(), ExStreamClient.Model.UpdateMessagePartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessagePartialResponse.t()} | {:error, any()}
  def update_message_partial(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_message(String.t(), ExStreamClient.Model.UpdateMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateMessageResponse.t()} | {:error, any()}
  def update_message(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/messages/#{id}", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_message(String.t()) ::
          {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  @spec get_message(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetMessageResponse.t()} | {:error, any()}
  def get_message(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/messages/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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
  - `deleted_by`
  - `hard`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_message(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  @spec delete_message(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.DeleteMessageResponse.t()} | {:error, any()}
  def delete_message(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/messages/#{id}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
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

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
