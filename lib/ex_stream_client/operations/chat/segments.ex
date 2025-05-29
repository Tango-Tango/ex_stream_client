defmodule ExStreamClient.Chat.Segments do
  @moduledoc "
	Modules for interacting with the `chat/segments` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/segments
	"
  require Logger
  @doc ~S"
	Get segment
	
	### Required Arguments:
		- `id`
	"
  @spec get_segment(String.t()) ::
          {:ok, ExStreamClient.Model.GetSegmentResponse.t()} | {:error, any()}
  def get_segment(id) do
    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "GetSegmentResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete segment
	
	### Required Arguments:
		- `id`
	"
  @spec delete_segment(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment(id) do
    request_opts = [url: "/api/v2/chat/segments/#{id}", method: :delete, params: %{}] ++ []

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
	Query segment targets
	
	### Required Arguments:
		- `id`
		- `payload`: QuerySegmentTargetsRequest
	"
  @spec query_segment_targets(String.t(), ExStreamClient.Model.QuerySegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentTargetsResponse.t()} | {:error, any()}
  def query_segment_targets(id, payload) do
    request_opts =
      [url: "/api/v2/chat/segments/#{id}/targets/query", method: :post, params: %{}] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QuerySegmentTargetsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Query segments
	
	### Required Arguments:
		- `payload`: QuerySegmentsRequest
	"
  @spec query_segments(ExStreamClient.Model.QuerySegmentsRequest.t()) ::
          {:ok, ExStreamClient.Model.QuerySegmentsResponse.t()} | {:error, any()}
  def query_segments(payload) do
    request_opts =
      [url: "/api/v2/chat/segments/query", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QuerySegmentsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete targets from a segment
	
	### Required Arguments:
		- `id`
		- `payload`: DeleteSegmentTargetsRequest
	"
  @spec delete_segment_targets(String.t(), ExStreamClient.Model.DeleteSegmentTargetsRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_segment_targets(id, payload) do
    request_opts =
      [url: "/api/v2/chat/segments/#{id}/deletetargets", method: :post, params: %{}] ++
        [json: payload]

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
	Check whether a target exists in a segment
	
	### Required Arguments:
		- `id`
		- `target_id`
	"
  @spec segment_target_exists(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def segment_target_exists(id, target_id) do
    request_opts =
      [url: "/api/v2/chat/segments/#{id}/target/#{target_id}", method: :get, params: %{}] ++ []

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