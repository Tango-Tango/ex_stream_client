defmodule ExStreamClient.Operations.Chat.Segments do
  @moduledoc ~S"""
  Modules for interacting with the `chat/segments` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Get segment


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_segment(String.t()) ::
          {:ok, ExStreamClient.Model.GetSegmentResponse.t()} | {:error, any()}
  @spec get_segment(String.t(), client: module()) ::
          {:ok, ExStreamClient.Model.GetSegmentResponse.t()} | {:error, any()}
  def get_segment(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetSegmentResponse,
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
  Delete a segment


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_segment(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_segment(String.t(), client: module()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :delete, params: []] ++ []

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Query segment targets


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.QuerySegmentTargetsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_segment_targets(String.t(), ExStreamClient.Model.QuerySegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentTargetsResponse.t()} | {:error, any()}
  @spec query_segment_targets(String.t(), ExStreamClient.Model.QuerySegmentTargetsRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.QuerySegmentTargetsResponse.t()} | {:error, any()}
  def query_segment_targets(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/targets/query", method: :post, params: []] ++
        [json: payload]

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
            201 => ExStreamClient.Model.QuerySegmentTargetsResponse,
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
  Query segments


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QuerySegmentsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec query_segments(ExStreamClient.Model.QuerySegmentsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentsResponse.t()} | {:error, any()}
  @spec query_segments(ExStreamClient.Model.QuerySegmentsRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.QuerySegmentsResponse.t()} | {:error, any()}
  def query_segments(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/segments/query", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QuerySegmentsResponse,
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
  Delete targets from a segment


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.DeleteSegmentTargetsRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_segment_targets(String.t(), ExStreamClient.Model.DeleteSegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_segment_targets(String.t(), ExStreamClient.Model.DeleteSegmentTargetsRequest.t(),
          client: module()
        ) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment_targets(id, payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/deletetargets", method: :post, params: []] ++
        [json: payload]

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
            201 => ExStreamClient.Model.Response,
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
  Check whether a target exists in a segment. Returns 200 if the target exists, 404 otherwise


  ### Required Arguments:
  - `id`
  - `target_id`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec segment_target_exists(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec segment_target_exists(String.t(), String.t(), client: module()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def segment_target_exists(id, target_id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/target/#{target_id}", method: :get, params: []] ++ []

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
