defmodule ExStreamClient.Operations.Chat.Threads do
  @moduledoc ~S"""
  Modules for interacting with the `chat/threads` group of Stream APIs

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
  Updates certain fields of the thread

  ### Sends events:
  - `thread.updated`
  - `thread.updated`


  ### Required Arguments:
  - `message_id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateThreadPartialRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_thread_partial(String.t(), ExStreamClient.Model.UpdateThreadPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateThreadPartialResponse.t()} | {:error, any()}
  @spec update_thread_partial(
          String.t(),
          ExStreamClient.Model.UpdateThreadPartialRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.UpdateThreadPartialResponse.t()} | {:error, any()}
  def update_thread_partial(message_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/threads/#{message_id}", method: :patch, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.UpdateThreadPartialResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Return a specific thread


  ### Required Arguments:
  - `message_id`
  ### Optional Arguments:
  - `member_limit`
  - `participant_limit`
  - `reply_limit`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_thread(String.t()) ::
          {:ok, ExStreamClient.Model.GetThreadResponse.t()} | {:error, any()}
  @spec get_thread(String.t(), [
          ({:member_limit, integer()}
           | {:participant_limit, integer()}
           | {:reply_limit, integer()})
          | shared_opts
        ]) :: {:ok, ExStreamClient.Model.GetThreadResponse.t()} | {:error, any()}
  def get_thread(message_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/threads/#{message_id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:reply_limit, :participant_limit, :member_limit]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetThreadResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Returns the list of threads for specific user


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryThreadsRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_threads(ExStreamClient.Model.QueryThreadsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryThreadsResponse.t()} | {:error, any()}
  @spec query_threads(ExStreamClient.Model.QueryThreadsRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.QueryThreadsResponse.t()} | {:error, any()}
  def query_threads(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/threads", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.QueryThreadsResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
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
