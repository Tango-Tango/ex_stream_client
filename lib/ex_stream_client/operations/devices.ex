defmodule ExStreamClient.Operations.Devices do
  @moduledoc ~S"""
  Modules for interacting with the `devices` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Adds a new device to a user, if the same device already exists the call will have no effect


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateDeviceRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec create_device(ExStreamClient.Model.CreateDeviceRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec create_device(ExStreamClient.Model.CreateDeviceRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def create_device(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Returns all available devices


  ### Optional Arguments:
  - `user_id`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec list_devices() :: {:ok, ExStreamClient.Model.ListDevicesResponse.t()} | {:error, any()}
  @spec list_devices([{:client, module()} | {:user_id, String.t()}]) ::
          {:ok, ExStreamClient.Model.ListDevicesResponse.t()} | {:error, any()}
  def list_devices(opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes one device


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `user_id`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec delete_device(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_device(String.t(), [{:client, module()} | {:user_id, String.t()}]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_device(id, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

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

    case client.request(r, opts) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
