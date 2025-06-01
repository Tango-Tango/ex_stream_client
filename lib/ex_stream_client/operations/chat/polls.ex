defmodule ExStreamClient.Operations.Chat.Polls do
  @moduledoc "
	Modules for interacting with the `chat/polls` group of Stream APIs

	API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
	"
  require Logger
  @doc ~S"
	Queries votes

	
	### Required Arguments:
		- `poll_id`
		- `payload`: QueryPollVotesRequest
	### Optional Arguments:
		- `user_id`
	"
  @spec query_poll_votes(String.t(), ExStreamClient.Model.QueryPollVotesRequest.t()) ::
          {:ok, ExStreamClient.Model.PollVotesResponse.t()} | {:error, any()}
  @spec query_poll_votes(String.t(), ExStreamClient.Model.QueryPollVotesRequest.t(),
          user_id: String.t()
        ) :: {:ok, ExStreamClient.Model.PollVotesResponse.t()} | {:error, any()}
  def query_poll_votes(poll_id, payload, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/#{poll_id}/votes",
        method: :post,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
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
            201 => ExStreamClient.Model.PollVotesResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Updates a poll

Sends events:
- poll.closed
- poll.updated

	
	### Required Arguments:
		- `payload`: UpdatePollRequest
	"
  @spec update_poll(ExStreamClient.Model.UpdatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll(payload) do
    request_opts = [url: "/api/v2/chat/polls", method: :put, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.PollResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Creates a new poll

	
	### Required Arguments:
		- `payload`: CreatePollRequest
	"
  @spec create_poll(ExStreamClient.Model.CreatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def create_poll(payload) do
    request_opts = [url: "/api/v2/chat/polls", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.PollResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Updates a poll option

Sends events:
- poll.updated

	
	### Required Arguments:
		- `poll_id`
		- `payload`: UpdatePollOptionRequest
	"
  @spec update_poll_option(String.t(), ExStreamClient.Model.UpdatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def update_poll_option(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}/options", method: :put, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.PollOptionResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Creates a poll option

Sends events:
- poll.updated

	
	### Required Arguments:
		- `poll_id`
		- `payload`: CreatePollOptionRequest
	"
  @spec create_poll_option(String.t(), ExStreamClient.Model.CreatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def create_poll_option(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}/options", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.PollOptionResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Updates a poll partially

Sends events:
- poll.updated

	
	### Required Arguments:
		- `poll_id`
		- `payload`: UpdatePollPartialRequest
	"
  @spec update_poll_partial(String.t(), ExStreamClient.Model.UpdatePollPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll_partial(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}", method: :patch, params: []] ++ [json: payload]

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
            200 => ExStreamClient.Model.PollResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Retrieves a poll

	
	### Required Arguments:
		- `poll_id`
	### Optional Arguments:
		- `user_id`
	"
  @spec get_poll(String.t()) :: {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  @spec get_poll(String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def get_poll(poll_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/#{poll_id}",
        method: :get,
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
            200 => ExStreamClient.Model.PollResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deletes a poll

Sends events:
- poll.deleted

	
	### Required Arguments:
		- `poll_id`
	### Optional Arguments:
		- `user_id`
	"
  @spec delete_poll(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_poll(String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_poll(poll_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/#{poll_id}",
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
            200 => ExStreamClient.Model.Response,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Queries polls

	
	### Required Arguments:
		- `payload`: QueryPollsRequest
	### Optional Arguments:
		- `user_id`
	"
  @spec query_polls(ExStreamClient.Model.QueryPollsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryPollsResponse.t()} | {:error, any()}
  @spec query_polls(ExStreamClient.Model.QueryPollsRequest.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.QueryPollsResponse.t()} | {:error, any()}
  def query_polls(payload, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/query",
        method: :post,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
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
            201 => ExStreamClient.Model.QueryPollsResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Retrieves a poll option

	
	### Required Arguments:
		- `poll_id`
		- `option_id`
	### Optional Arguments:
		- `user_id`
	"
  @spec get_poll_option(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  @spec get_poll_option(String.t(), String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def get_poll_option(poll_id, option_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/#{poll_id}/options/#{option_id}",
        method: :get,
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
            200 => ExStreamClient.Model.PollOptionResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deletes a poll option

Sends events:
- poll.updated

	
	### Required Arguments:
		- `poll_id`
		- `option_id`
	### Optional Arguments:
		- `user_id`
	"
  @spec delete_poll_option(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_poll_option(String.t(), String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_poll_option(poll_id, option_id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/polls/#{poll_id}/options/#{option_id}",
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
            200 => ExStreamClient.Model.Response,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
