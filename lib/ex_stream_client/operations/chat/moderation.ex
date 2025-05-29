defmodule ExStreamClient.Chat.Moderation do
  @moduledoc "
	Modules for interacting with the `chat/moderation` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/moderation
	"
  require Logger
  @doc ~S"
	Query Message Flags
	
	### Required Arguments:
		
	### Optional Arguments:
		- `payload`: QueryMessageFlagsPayload
	"
  @spec query_message_flags() ::
          {:ok, ExStreamClient.Model.QueryMessageFlagsResponse.t()} | {:error, any()}
  @spec query_message_flags(payload: ExStreamClient.Model.QueryMessageFlagsPayload.t()) ::
          {:ok, ExStreamClient.Model.QueryMessageFlagsResponse.t()} | {:error, any()}
  def query_message_flags(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/moderation/flags/message",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
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
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "QueryMessageFlagsResponse"}
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
	Unmute channel
	
	### Required Arguments:
		- `payload`: UnmuteChannelRequest
	"
  @spec unmute_channel(ExStreamClient.Model.UnmuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  def unmute_channel(payload) do
    request_opts =
      [url: "/api/v2/chat/moderation/unmute/channel", method: :post, params: %{}] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "UnmuteResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Mute channel
	
	### Required Arguments:
		- `payload`: MuteChannelRequest
	"
  @spec mute_channel(ExStreamClient.Model.MuteChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.MuteChannelResponse.t()} | {:error, any()}
  def mute_channel(payload) do
    request_opts =
      [url: "/api/v2/chat/moderation/mute/channel", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "MuteChannelResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end