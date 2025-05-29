defmodule ExStreamClient.Chat.Polls do
  @moduledoc "
	Modules for interacting with the `chat/polls` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/polls
	"
  require Logger
  @doc ~S"
	Query votes
	
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
          |> Map.new()
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollVotesResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Update poll
	
	### Required Arguments:
		- `payload`: UpdatePollRequest
	"
  @spec update_poll(ExStreamClient.Model.UpdatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll(payload) do
    request_opts = [url: "/api/v2/chat/polls", method: :put, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Create poll
	
	### Required Arguments:
		- `payload`: CreatePollRequest
	"
  @spec create_poll(ExStreamClient.Model.CreatePollRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def create_poll(payload) do
    request_opts = [url: "/api/v2/chat/polls", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Update poll option
	
	### Required Arguments:
		- `poll_id`
		- `payload`: UpdatePollOptionRequest
	"
  @spec update_poll_option(String.t(), ExStreamClient.Model.UpdatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def update_poll_option(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}/options", method: :put, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollOptionResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Create poll option
	
	### Required Arguments:
		- `poll_id`
		- `payload`: CreatePollOptionRequest
	"
  @spec create_poll_option(String.t(), ExStreamClient.Model.CreatePollOptionRequest.t()) ::
          {:ok, ExStreamClient.Model.PollOptionResponse.t()} | {:error, any()}
  def create_poll_option(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}/options", method: :post, params: %{}] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollOptionResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Partial update poll
	
	### Required Arguments:
		- `poll_id`
		- `payload`: UpdatePollPartialRequest
	"
  @spec update_poll_partial(String.t(), ExStreamClient.Model.UpdatePollPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.PollResponse.t()} | {:error, any()}
  def update_poll_partial(poll_id, payload) do
    request_opts =
      [url: "/api/v2/chat/polls/#{poll_id}", method: :patch, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get poll
	
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete poll
	
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Query polls
	
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
          |> Map.new()
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "QueryPollsResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get poll option
	
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "PollOptionResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete poll option
	
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end