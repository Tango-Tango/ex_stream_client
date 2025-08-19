defmodule ExStreamClient.Operations.Chat.Commands do
  @moduledoc ~S"""
  Modules for interacting with the `chat/commands` group of Stream APIs

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
  Creates custom chat command


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateCommandRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_command(ExStreamClient.Model.CreateCommandRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateCommandResponse.t()} | {:error, any()}
  @spec create_command(ExStreamClient.Model.CreateCommandRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CreateCommandResponse.t()} | {:error, any()}
  def create_command(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/commands", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.CreateCommandResponse,
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
  Returns all custom commands


  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_commands() :: {:ok, ExStreamClient.Model.ListCommandsResponse.t()} | {:error, any()}
  @spec list_commands(shared_opts) ::
          {:ok, ExStreamClient.Model.ListCommandsResponse.t()} | {:error, any()}
  def list_commands(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/commands", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.ListCommandsResponse,
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
  Updates custom chat command


  ### Required Arguments:
  - `name`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateCommandRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_command(String.t(), ExStreamClient.Model.UpdateCommandRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateCommandResponse.t()} | {:error, any()}
  @spec update_command(String.t(), ExStreamClient.Model.UpdateCommandRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UpdateCommandResponse.t()} | {:error, any()}
  def update_command(name, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/chat/commands/#{name}", method: :put, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UpdateCommandResponse,
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
  Returns custom command by its name


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_command(String.t()) ::
          {:ok, ExStreamClient.Model.GetCommandResponse.t()} | {:error, any()}
  @spec get_command(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.GetCommandResponse.t()} | {:error, any()}
  def get_command(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/commands/#{name}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetCommandResponse,
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
  Deletes custom chat command


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_command(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteCommandResponse.t()} | {:error, any()}
  @spec delete_command(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeleteCommandResponse.t()} | {:error, any()}
  def delete_command(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/chat/commands/#{name}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.DeleteCommandResponse,
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
