defmodule ExStreamClient.Operations.App do
  @moduledoc ~S"""
  Modules for interacting with the `app` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  This Method updates one or more application settings


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpdateAppRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec update_app(ExStreamClient.Model.UpdateAppRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec update_app(ExStreamClient.Model.UpdateAppRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def update_app(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts = [url: "/api/v2/app", method: :patch, params: []] ++ [json: payload]

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
  This Method returns the application settings


  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_app() :: {:ok, ExStreamClient.Model.GetApplicationResponse.t()} | {:error, any()}
  @spec get_app(client: module()) ::
          {:ok, ExStreamClient.Model.GetApplicationResponse.t()} | {:error, any()}
  def get_app(opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts = [url: "/api/v2/app", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetApplicationResponse,
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
