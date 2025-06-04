defmodule ExStreamClient.Operations.Roles do
  @moduledoc ~S"""
  Modules for interacting with the `roles` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Creates custom role


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateRoleRequest`
  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec create_role(ExStreamClient.Model.CreateRoleRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateRoleResponse.t()} | {:error, any()}
  @spec create_role(ExStreamClient.Model.CreateRoleRequest.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.CreateRoleResponse.t()} | {:error, any()}
  def create_role(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/roles", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateRoleResponse,
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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Lists all available roles


  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec list_roles() :: {:ok, ExStreamClient.Model.ListRolesResponse.t()} | {:error, any()}
  @spec list_roles([
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.ListRolesResponse.t()} | {:error, any()}
  def list_roles(opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/roles", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListRolesResponse,
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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes custom role


  ### Required Arguments:
  - `name`
  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec delete_role(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_role(String.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_role(name, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/roles/#{name}", method: :delete, params: []] ++ []

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

    case client.request(r, get_request_opts(opts)) do
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
