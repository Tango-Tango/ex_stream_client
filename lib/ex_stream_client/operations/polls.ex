defmodule ExStreamClient.Operations.Polls do
  @moduledoc ~S"""
  Modules for interacting with the `polls` group of Stream APIs

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

  @type shared_opts :: [
          api_key: String.t(),
          api_key_secret: String.t(),
          client: module(),
          endpoint: String.t(),
          req_opts: keyword()
        ]
  @doc ~S"""
  Updates a poll option

  ### Sends events:
  - `feeds.poll.updated`
  - `poll.updated`


  ### Required Arguments:
  - `poll_id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdatePollOptionRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_poll_option(String.t(), ExStreamClient.Model.UpdatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  @spec update_poll_option(
          String.t(),
          ExStreamClient.Model.UpdatePollOptionRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def update_poll_option(poll_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/polls/#{poll_id}/options", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollOptionResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Creates a poll option

  ### Sends events:
  - `feeds.poll.updated`
  - `poll.updated`


  ### Required Arguments:
  - `poll_id`
  - `payload`: `Elixir.ExStreamClient.Model.CreatePollOptionRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_poll_option(String.t(), ExStreamClient.Model.CreatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  @spec create_poll_option(
          String.t(),
          ExStreamClient.Model.CreatePollOptionRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def create_poll_option(poll_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/polls/#{poll_id}/options", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollOptionResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Queries polls


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryPollsRequest`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_polls(ExStreamClient.Model.QueryPollsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryPollsResponse.t()} | {:error, any()}
  @spec query_polls(ExStreamClient.Model.QueryPollsRequest.t(), [
          {:user_id, String.t()} | shared_opts
        ]) :: {:ok, ExStreamClient.Model.QueryPollsResponse.t()} | {:error, any()}
  def query_polls(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/query",
        method: :post,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QueryPollsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Queries votes


  ### Required Arguments:
  - `poll_id`
  - `payload`: `Elixir.ExStreamClient.Model.QueryPollVotesRequest`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_poll_votes(String.t(), ExStreamClient.Model.QueryPollVotesRequest.t()) ::
          {:ok, ExStreamClient.Model.PollVotesResponse.t()} | {:error, any()}
  @spec query_poll_votes(String.t(), ExStreamClient.Model.QueryPollVotesRequest.t(), [
          {:user_id, String.t()} | shared_opts
        ]) :: {:ok, ExStreamClient.Model.PollVotesResponse.t()} | {:error, any()}
  def query_poll_votes(poll_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/#{poll_id}/votes",
        method: :post,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollVotesResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieves a poll option


  ### Required Arguments:
  - `poll_id`
  - `option_id`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_poll_option(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  @spec get_poll_option(String.t(), String.t(), [{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def get_poll_option(poll_id, option_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/#{poll_id}/options/#{option_id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.PollOptionResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes a poll option

  ### Sends events:
  - `feeds.poll.updated`
  - `poll.updated`


  ### Required Arguments:
  - `poll_id`
  - `option_id`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_poll_option(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_poll_option(String.t(), String.t(), [{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_poll_option(poll_id, option_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/#{poll_id}/options/#{option_id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.Response,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Updates a poll

  ### Sends events:
  - `feeds.poll.closed`
  - `feeds.poll.updated`
  - `poll.closed`
  - `poll.updated`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpdatePollRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_poll(ExStreamClient.Model.UpdatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  @spec update_poll(ExStreamClient.Model.UpdatePollRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/polls", method: :put, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Creates a new poll


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreatePollRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_poll(ExStreamClient.Model.CreatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  @spec create_poll(ExStreamClient.Model.CreatePollRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def create_poll(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/polls", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.PollResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Updates a poll partially

  ### Sends events:
  - `feeds.poll.closed`
  - `feeds.poll.updated`
  - `poll.closed`
  - `poll.updated`


  ### Required Arguments:
  - `poll_id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdatePollPartialRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_poll_partial(String.t(), ExStreamClient.Model.UpdatePollPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  @spec update_poll_partial(
          String.t(),
          ExStreamClient.Model.UpdatePollPartialRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll_partial(poll_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/polls/#{poll_id}", method: :patch, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.PollResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieves a poll


  ### Required Arguments:
  - `poll_id`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_poll(String.t()) :: {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  @spec get_poll(String.t(), [{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def get_poll(poll_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/#{poll_id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.PollResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
        end
      )

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes a poll

  ### Sends events:
  - `feeds.poll.deleted`
  - `poll.deleted`


  ### Required Arguments:
  - `poll_id`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_poll(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_poll(String.t(), [{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_poll(poll_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/polls/#{poll_id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.Response,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          {request, %{response | body: decode_response(response, response_handlers)}}
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

  defp decode_response(response, response_handlers) do
    case Map.get(response_handlers, response.status) do
      nil -> {:error, response.body}
      mod -> {get_response_type(response), mod.decode(response.body)}
    end
  end

  defp get_response_type(response) do
    if response.status in 200..299 do
      :ok
    else
      :error
    end
  end

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
