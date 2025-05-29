defmodule ExStreamClient.Chat.Channeltypes do
  @moduledoc "
	Modules for interacting with the `chat/channeltypes` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/channeltypes
	"
  require Logger
  @doc ~S"
	Update channel type
	
	### Required Arguments:
		- `name`
		- `payload`: UpdateChannelTypeRequest
	"
  @spec update_channel_type(String.t(), ExStreamClient.Model.UpdateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateChannelTypeResponse.t()} | {:error, any()}
  def update_channel_type(name, payload) do
    request_opts =
      [url: "/api/v2/chat/channeltypes/#{name}", method: :put, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpdateChannelTypeResponse"}
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
	Get channel type
	
	### Required Arguments:
		- `name`
	"
  @spec get_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.GetChannelTypeResponse.t()} | {:error, any()}
  def get_channel_type(name) do
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetChannelTypeResponse"}
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
	Delete channel type
	
	### Required Arguments:
		- `name`
	"
  @spec delete_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_channel_type(name) do
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :delete, params: %{}] ++ []

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
	Create channel type
	
	### Required Arguments:
		- `payload`: CreateChannelTypeRequest
	"
  @spec create_channel_type(ExStreamClient.Model.CreateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateChannelTypeResponse.t()} | {:error, any()}
  def create_channel_type(payload) do
    request_opts =
      [url: "/api/v2/chat/channeltypes", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateChannelTypeResponse"}
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
	List channel types
	
	### Required Arguments:
		
	"
  @spec list_channel_types() ::
          {:ok, ExStreamClient.Model.ListChannelTypesResponse.t()} | {:error, any()}
  def list_channel_types() do
    request_opts = [url: "/api/v2/chat/channeltypes", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ListChannelTypesResponse"}
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