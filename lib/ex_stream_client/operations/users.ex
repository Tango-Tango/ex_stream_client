defmodule ExStreamClient.Operations.Users do
  @moduledoc ~S"""
  Modules for interacting with the `users` group of Stream APIs

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
  Activates user who's been deactivated previously

  ### Sends events:
  - `user.reactivated`


  ### Required Arguments:
  - `user_id`
  - `payload`: `Elixir.ExStreamClient.Model.ReactivateUserRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec reactivate_user(String.t(), ExStreamClient.Model.ReactivateUserRequest.t()) ::
          {:ok, ExStreamClient.Model.ReactivateUserResponse.t()} | {:error, any()}
  @spec reactivate_user(String.t(), ExStreamClient.Model.ReactivateUserRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.ReactivateUserResponse.t()} | {:error, any()}
  def reactivate_user(user_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/users/#{user_id}/reactivate", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.ReactivateUserResponse,
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
  Update or create users in bulk

  ### Sends events:
  - `user.updated`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpdateUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_users(ExStreamClient.Model.UpdateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  @spec update_users(ExStreamClient.Model.UpdateUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  def update_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UpdateUsersResponse,
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
  Updates certain fields of the user

  ### Sends events:
  - `user.presence.changed`
  - `user.updated`
  - `user.presence.changed`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpdateUsersPartialRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_users_partial(ExStreamClient.Model.UpdateUsersPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  @spec update_users_partial(ExStreamClient.Model.UpdateUsersPartialRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  def update_users_partial(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users", method: :patch, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.UpdateUsersResponse,
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
  Find and filter users


  ### Optional Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryUsersPayload`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_users() :: {:ok, ExStreamClient.Model.QueryUsersResponse.t()} | {:error, any()}
  @spec query_users([{:payload, ExStreamClient.Model.QueryUsersPayload.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.QueryUsersResponse.t()} | {:error, any()}
  def query_users(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/users",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.QueryUsersResponse,
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
  Deletes users and optionally all their belongings asynchronously.

  ### Sends events:
  - `channel.deleted`
  - `user.deleted`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.DeleteUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_users(ExStreamClient.Model.DeleteUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.DeleteUsersResponse.t()} | {:error, any()}
  @spec delete_users(ExStreamClient.Model.DeleteUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeleteUsersResponse.t()} | {:error, any()}
  def delete_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/delete", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.DeleteUsersResponse,
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
  Updates an existing live location with new coordinates or expiration time


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpdateLiveLocationRequest`
  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_live_location(ExStreamClient.Model.UpdateLiveLocationRequest.t()) ::
          {:ok, ExStreamClient.Model.SharedLocationResponse.t()} | {:error, any()}
  @spec update_live_location(ExStreamClient.Model.UpdateLiveLocationRequest.t(), [
          {:user_id, String.t()} | shared_opts
        ]) :: {:ok, ExStreamClient.Model.SharedLocationResponse.t()} | {:error, any()}
  def update_live_location(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/users/live_locations",
        method: :put,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.SharedLocationResponse,
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
  Retrieves all active live locations for a user


  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_user_live_locations() ::
          {:ok, ExStreamClient.Model.SharedLocationsResponse.t()} | {:error, any()}
  @spec get_user_live_locations([{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.SharedLocationsResponse.t()} | {:error, any()}
  def get_user_live_locations(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/users/live_locations",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.SharedLocationsResponse,
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
  Reactivate users in batches

  ### Sends events:
  - `user.reactivated`
  - `user.reactivated`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.ReactivateUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec reactivate_users(ExStreamClient.Model.ReactivateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.ReactivateUsersResponse.t()} | {:error, any()}
  @spec reactivate_users(ExStreamClient.Model.ReactivateUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.ReactivateUsersResponse.t()} | {:error, any()}
  def reactivate_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/reactivate", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.ReactivateUsersResponse,
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
  Exports the user's profile, reactions and messages. Raises an error if a user has more than 10k messages or reactions


  ### Required Arguments:
  - `user_id`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec export_user(String.t()) ::
          {:ok, ExStreamClient.Model.ExportUserResponse.t()} | {:error, any()}
  @spec export_user(String.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.ExportUserResponse.t()} | {:error, any()}
  def export_user(user_id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/#{user_id}/export", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.ExportUserResponse,
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
  Deactivate users in batches

  ### Sends events:
  - `user.deactivated`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.DeactivateUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec deactivate_users(ExStreamClient.Model.DeactivateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.DeactivateUsersResponse.t()} | {:error, any()}
  @spec deactivate_users(ExStreamClient.Model.DeactivateUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeactivateUsersResponse.t()} | {:error, any()}
  def deactivate_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/deactivate", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.DeactivateUsersResponse,
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
  Restore soft deleted users


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.RestoreUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec restore_users(ExStreamClient.Model.RestoreUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec restore_users(ExStreamClient.Model.RestoreUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def restore_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/restore", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.Response,
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
  Unblock users


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UnblockUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec unblock_users(ExStreamClient.Model.UnblockUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.UnblockUsersResponse.t()} | {:error, any()}
  @spec unblock_users(ExStreamClient.Model.UnblockUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.UnblockUsersResponse.t()} | {:error, any()}
  def unblock_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/unblock", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UnblockUsersResponse,
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
  Block users


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.BlockUsersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec block_users(ExStreamClient.Model.BlockUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.BlockUsersResponse.t()} | {:error, any()}
  @spec block_users(ExStreamClient.Model.BlockUsersRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.BlockUsersResponse.t()} | {:error, any()}
  def block_users(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/users/block", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.BlockUsersResponse,
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
  Get list of blocked Users


  ### Optional Arguments:
  - `user_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_blocked_users() ::
          {:ok, ExStreamClient.Model.GetBlockedUsersResponse.t()} | {:error, any()}
  @spec get_blocked_users([{:user_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.GetBlockedUsersResponse.t()} | {:error, any()}
  def get_blocked_users(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/users/block",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetBlockedUsersResponse,
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
  Deactivates user with possibility to activate it back

  ### Sends events:
  - `user.deactivated`


  ### Required Arguments:
  - `user_id`
  - `payload`: `Elixir.ExStreamClient.Model.DeactivateUserRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec deactivate_user(String.t(), ExStreamClient.Model.DeactivateUserRequest.t()) ::
          {:ok, ExStreamClient.Model.DeactivateUserResponse.t()} | {:error, any()}
  @spec deactivate_user(String.t(), ExStreamClient.Model.DeactivateUserRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.DeactivateUserResponse.t()} | {:error, any()}
  def deactivate_user(user_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/users/#{user_id}/deactivate", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.DeactivateUserResponse,
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
