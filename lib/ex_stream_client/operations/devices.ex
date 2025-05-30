defmodule ExStreamClient.Devices do
  @moduledoc "
	Modules for interacting with the `devices` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/devices
	"
  require Logger
  @doc ~S"
	Create device
	
	### Required Arguments:
		- `payload`: CreateDeviceRequest
	"
  @spec create_device(ExStreamClient.Model.CreateDeviceRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def create_device(payload) do
    request_opts = [url: "/api/v2/devices", method: :post, params: []] ++ [json: payload]

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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	List devices
	
	### Required Arguments:
		
	### Optional Arguments:
		- `user_id`
	"
  @spec list_devices() :: {:ok, ExStreamClient.Model.ListDevicesResponse.t()} | {:error, any()}
  @spec list_devices(user_id: String.t()) ::
          {:ok, ExStreamClient.Model.ListDevicesResponse.t()} | {:error, any()}
  def list_devices(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/devices",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
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
            200 => ExStreamClient.Model.ListDevicesResponse,
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Delete device
	
	### Required Arguments:
		- `id`
	### Optional Arguments:
		- `user_id`
	"
  @spec delete_device(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_device(String.t(), user_id: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_device(id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/devices",
        method: :delete,
        params:
          Keyword.merge([id: id], Keyword.take(opts, [:user_id]))
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
