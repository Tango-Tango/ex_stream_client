defmodule ExStreamClient.Operations.Chat.RetentionPolicy do
  @moduledoc ~S"""
  Modules for interacting with the `chat/retention_policy` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `authenticate_as_user` - User id to authenticate. If not provided, the server key will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
   * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options
  """
  require Logger

  @type shared_opts :: [
          api_key: String.t(),
          api_key_secret: String.t(),
          authenticate_as_user: String.t(),
          client: module(),
          endpoint: String.t(),
          req_opts: keyword()
        ]
  @doc ~S"""
  Removes a retention policy for the app. Server-side only.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.DeleteRetentionPolicyRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_retention_policy(ExStreamClient.Model.DeleteRetentionPolicyRequest.t()) ::
          {:ok, ExStreamClient.Model.DeleteRetentionPolicyResponse.t()} | {:error, any()}
  @spec delete_retention_policy(
          ExStreamClient.Model.DeleteRetentionPolicyRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.DeleteRetentionPolicyResponse.t()} | {:error, any()}
  def delete_retention_policy(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/retention_policy/delete", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.DeleteRetentionPolicyResponse,
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
  Creates or updates a retention policy for the app. Server-side only.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.SetRetentionPolicyRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec set_retention_policy(ExStreamClient.Model.SetRetentionPolicyRequest.t()) ::
          {:ok, ExStreamClient.Model.SetRetentionPolicyResponse.t()} | {:error, any()}
  @spec set_retention_policy(ExStreamClient.Model.SetRetentionPolicyRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.SetRetentionPolicyResponse.t()} | {:error, any()}
  def set_retention_policy(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/retention_policy", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.SetRetentionPolicyResponse,
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
  Returns all retention policies configured for the app. Server-side only.


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_retention_policy() ::
          {:ok, ExStreamClient.Model.GetRetentionPolicyResponse.t()} | {:error, any()}
  @spec get_retention_policy(shared_opts) ::
          {:ok, ExStreamClient.Model.GetRetentionPolicyResponse.t()} | {:error, any()}
  def get_retention_policy(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/retention_policy", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetRetentionPolicyResponse,
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
  Returns filtered and sorted retention cleanup run history for the app. Supports filter_conditions on 'policy' (possible values: 'old-messages', 'inactive-channels') and 'date' fields. Server-side only.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.GetRetentionPolicyRunsRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_retention_policy_runs(ExStreamClient.Model.GetRetentionPolicyRunsRequest.t()) ::
          {:ok, ExStreamClient.Model.GetRetentionPolicyRunsResponse.t()} | {:error, any()}
  @spec get_retention_policy_runs(
          ExStreamClient.Model.GetRetentionPolicyRunsRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.GetRetentionPolicyRunsResponse.t()} | {:error, any()}
  def get_retention_policy_runs(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/retention_policy/runs", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.GetRetentionPolicyRunsResponse,
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
    Keyword.take(opts, [:api_key, :api_key_secret, :authenticate_as_user, :endpoint])
  end
end
