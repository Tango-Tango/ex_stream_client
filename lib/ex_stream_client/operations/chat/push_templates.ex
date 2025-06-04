defmodule ExStreamClient.Operations.Chat.PushTemplates do
  @moduledoc ~S"""
  Modules for interacting with the `chat/push_templates` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Create or update a push notification template for a specific event type and push provider


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertPushTemplateRequest`
  ### Optional Arguments:
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec upsert_push_template(ExStreamClient.Model.UpsertPushTemplateRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertPushTemplateResponse.t()} | {:error, any()}
  @spec upsert_push_template(ExStreamClient.Model.UpsertPushTemplateRequest.t(), client: module()) ::
          {:ok, ExStreamClient.Model.UpsertPushTemplateResponse.t()} | {:error, any()}
  def upsert_push_template(payload, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [url: "/api/v2/chat/push_templates", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpsertPushTemplateResponse,
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
  Retrieve push notification templates for Chat.


  ### Required Arguments:
  - `push_provider_type`
  ### Optional Arguments:
  - `push_provider_name`
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  """
  @spec get_push_templates(String.t()) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  @spec get_push_templates(String.t(), [{:client, module()} | {:push_provider_name, String.t()}]) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  def get_push_templates(push_provider_type, opts \\ []) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    request_opts =
      [
        url: "/api/v2/chat/push_templates",
        method: :get,
        params:
          Keyword.merge(
            [push_provider_type: push_provider_type],
            Keyword.take(opts, [:push_provider_name])
          )
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
            200 => ExStreamClient.Model.GetPushTemplatesResponse,
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
