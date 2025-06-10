defmodule ExStreamClient.Operations.Chat.Segments do
  @moduledoc ~S"""
  Modules for interacting with the `chat/segments` group of Stream APIs

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
  Get segment


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_segment(String.t()) ::
          {:ok, ExStreamClient.Model.GetSegmentResponse.t()} | {:error, any()}
  @spec get_segment(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.GetSegmentResponse.t()} | {:error, any()}
  def get_segment(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetSegmentResponse,
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
  Delete a segment


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_segment(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_segment(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :delete, params: []] ++ []
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
  Query segment targets


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.QuerySegmentTargetsRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_segment_targets(String.t(), ExStreamClient.Model.QuerySegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentTargetsResponse.t()} | {:error, any()}
  @spec query_segment_targets(
          String.t(),
          ExStreamClient.Model.QuerySegmentTargetsRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.QuerySegmentTargetsResponse.t()} | {:error, any()}
  def query_segment_targets(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/targets/query", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QuerySegmentTargetsResponse,
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
  Query segments


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QuerySegmentsRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_segments(ExStreamClient.Model.QuerySegmentsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentsResponse.t()} | {:error, any()}
  @spec query_segments(ExStreamClient.Model.QuerySegmentsRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.QuerySegmentsResponse.t()} | {:error, any()}
  def query_segments(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/segments/query", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.QuerySegmentsResponse,
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
  Delete targets from a segment


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.DeleteSegmentTargetsRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_segment_targets(String.t(), ExStreamClient.Model.DeleteSegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_segment_targets(
          String.t(),
          ExStreamClient.Model.DeleteSegmentTargetsRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment_targets(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/deletetargets", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.Response,
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
  Check whether a target exists in a segment. Returns 200 if the target exists, 404 otherwise


  ### Required Arguments:
  - `id`
  - `target_id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec segment_target_exists(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec segment_target_exists(String.t(), String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def segment_target_exists(id, target_id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/segments/#{id}/target/#{target_id}", method: :get, params: []] ++ []

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
