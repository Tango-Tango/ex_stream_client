defmodule ExStreamClient.Operations.Chat.Channeltypes do
  @moduledoc "
	Modules for interacting with the `chat/channeltypes` group of Stream APIs

	API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
	"
  require Logger
  @doc ~S"
	Updates channel type

	
	### Required Arguments:
		- `name`
		- `payload`: UpdateChannelTypeRequest
	"
  @spec update_channel_type(String.t(), ExStreamClient.Model.UpdateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateChannelTypeResponse.t()} | {:error, any()}
  def update_channel_type(name, payload) do
    request_opts =
      [url: "/api/v2/chat/channeltypes/#{name}", method: :put, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateChannelTypeResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Gets channel type

	
	### Required Arguments:
		- `name`
	"
  @spec get_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.GetChannelTypeResponse.t()} | {:error, any()}
  def get_channel_type(name) do
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetChannelTypeResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deletes channel type

	
	### Required Arguments:
		- `name`
	"
  @spec delete_channel_type(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_channel_type(name) do
    request_opts = [url: "/api/v2/chat/channeltypes/#{name}", method: :delete, params: []] ++ []

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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Creates new channel type

	
	### Required Arguments:
		- `payload`: CreateChannelTypeRequest
	"
  @spec create_channel_type(ExStreamClient.Model.CreateChannelTypeRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateChannelTypeResponse.t()} | {:error, any()}
  def create_channel_type(payload) do
    request_opts =
      [url: "/api/v2/chat/channeltypes", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateChannelTypeResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Lists all available channel types

	
	### Required Arguments:
		
	"
  @spec list_channel_types() ::
          {:ok, ExStreamClient.Model.ListChannelTypesResponse.t()} | {:error, any()}
  def list_channel_types() do
    request_opts = [url: "/api/v2/chat/channeltypes", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListChannelTypesResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
