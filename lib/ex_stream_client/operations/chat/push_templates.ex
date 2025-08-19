defmodule ExStreamClient.Operations.Chat.PushTemplates do
  @moduledoc ~S"""
  Modules for interacting with the `chat/push_templates` group of Stream APIs

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
  Create or update a push notification template for a specific event type and push provider


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertPushTemplateRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec upsert_push_template(ExStreamClient.Model.UpsertPushTemplateRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertPushTemplateResponse.t()} | {:error, any()}
  @spec upsert_push_template(ExStreamClient.Model.UpsertPushTemplateRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UpsertPushTemplateResponse.t()} | {:error, any()}
  def upsert_push_template(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/push_templates", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UpsertPushTemplateResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
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
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_push_templates(String.t()) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  @spec get_push_templates(String.t(), [{:push_provider_name, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  def get_push_templates(push_provider_type, opts \\ []) do
    client = get_client(opts)

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

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetPushTemplatesResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    case client.request(
           Req.new(request_opts),
           get_request_opts(opts) ++ [response_handlers: response_handlers]
         ) do
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

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
