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
          |> Map.new(),
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.QueryMessageFlagsResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
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
      [
        url: "/api/v2/chat/moderation/unmute/channel",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UnmuteResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
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
      [
        url: "/api/v2/chat/moderation/mute/channel",
        method: :post,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.MuteChannelResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end
end
