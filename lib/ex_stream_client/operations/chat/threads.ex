defmodule ExStreamClient.Operations.Chat.Threads do
  @moduledoc ~S"""
  Modules for interacting with the `chat/threads` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Updates certain fields of the thread

  ### Sends events:
  - `thread.updated`
  - `thread.updated`


  ### Required Arguments:
  - `message_id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateThreadPartialRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec update_thread_partial(String.t(), ExStreamClient.Model.UpdateThreadPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateThreadPartialResponse.t()} | {:error, any()}
  @spec update_thread_partial(String.t(), ExStreamClient.Model.UpdateThreadPartialRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.UpdateThreadPartialResponse.t()} | {:error, any()}
  def update_thread_partial(message_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/threads/#{message_id}", method: :patch, params: []] ++ [json: payload]

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
            200 => ExStreamClient.Model.UpdateThreadPartialResponse,
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
  Return a specific thread


  ### Required Arguments:
  - `message_id`
  ### Optional Arguments:
  - `reply_limit`
  - `participant_limit`
  - `member_limit`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_thread(String.t()) ::
          {:ok, ExStreamClient.Model.GetThreadResponse.t()} | {:error, any()}
  @spec get_thread(String.t(), [
          {:client, module()}
          | {:member_limit, integer()}
          | {:participant_limit, integer()}
          | {:reply_limit, integer()}
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
            200 => ExStreamClient.Model.GetThreadResponse,
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
  Returns the list of threads for specific user


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryThreadsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_threads(ExStreamClient.Model.QueryThreadsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryThreadsResponse.t()} | {:error, any()}
  @spec query_threads(ExStreamClient.Model.QueryThreadsRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.QueryThreadsResponse.t()} | {:error, any()}
  def query_threads(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/threads", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryThreadsResponse,
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

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end
end
