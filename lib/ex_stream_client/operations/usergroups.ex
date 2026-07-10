defmodule ExStreamClient.Operations.Usergroups do
  @moduledoc ~S"""
  Modules for interacting with the `usergroups` group of Stream APIs

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
  Creates a new user group, optionally with initial members


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateUserGroupRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec create_user_group(ExStreamClient.Model.CreateUserGroupRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateUserGroupResponse.t()} | {:error, any()}
  @spec create_user_group(ExStreamClient.Model.CreateUserGroupRequest.t(), shared_opts) ::
          {:ok, ExStreamClient.Model.CreateUserGroupResponse.t()} | {:error, any()}
  def create_user_group(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/usergroups", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.CreateUserGroupResponse,
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
  Lists user groups with cursor-based pagination


  ### Optional Arguments:
  - `created_at_gt`
  - `id_gt`
  - `limit`
  - `team_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec list_user_groups() ::
          {:ok, ExStreamClient.Model.ListUserGroupsResponse.t()} | {:error, any()}
  @spec list_user_groups([
          ({:team_id, String.t()}
           | {:created_at_gt, String.t()}
           | {:id_gt, String.t()}
           | {:limit, integer()})
          | shared_opts
        ]) :: {:ok, ExStreamClient.Model.ListUserGroupsResponse.t()} | {:error, any()}
  def list_user_groups(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/usergroups",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:limit, :id_gt, :created_at_gt, :team_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.ListUserGroupsResponse,
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
  Searches user groups by name prefix for autocomplete


  ### Required Arguments:
  - `query`
  ### Optional Arguments:
  - `id_gt`
  - `limit`
  - `name_gt`
  - `team_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec search_user_groups(String.t()) ::
          {:ok, ExStreamClient.Model.SearchUserGroupsResponse.t()} | {:error, any()}
  @spec search_user_groups(String.t(), [
          ({:team_id, String.t()}
           | {:id_gt, String.t()}
           | {:name_gt, String.t()}
           | {:limit, integer()})
          | shared_opts
        ]) :: {:ok, ExStreamClient.Model.SearchUserGroupsResponse.t()} | {:error, any()}
  def search_user_groups(query, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/usergroups/search",
        method: :get,
        params:
          Keyword.merge([query: query], Keyword.take(opts, [:limit, :name_gt, :id_gt, :team_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.SearchUserGroupsResponse,
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
  Adds members to a user group. All user IDs must exist. The operation is all-or-nothing.


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.AddUserGroupMembersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec add_user_group_members(String.t(), ExStreamClient.Model.AddUserGroupMembersRequest.t()) ::
          {:ok, ExStreamClient.Model.AddUserGroupMembersResponse.t()} | {:error, any()}
  @spec add_user_group_members(
          String.t(),
          ExStreamClient.Model.AddUserGroupMembersRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.AddUserGroupMembersResponse.t()} | {:error, any()}
  def add_user_group_members(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/usergroups/#{id}/members", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.AddUserGroupMembersResponse,
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
  Updates a user group's name and/or description. team_id is immutable.


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateUserGroupRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec update_user_group(String.t(), ExStreamClient.Model.UpdateUserGroupRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateUserGroupResponse.t()} | {:error, any()}
  @spec update_user_group(
          String.t(),
          ExStreamClient.Model.UpdateUserGroupRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.UpdateUserGroupResponse.t()} | {:error, any()}
  def update_user_group(id, payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/usergroups/#{id}", method: :put, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.UpdateUserGroupResponse,
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
  Gets a user group by ID, including its members


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `team_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_user_group(String.t()) ::
          {:ok, ExStreamClient.Model.GetUserGroupResponse.t()} | {:error, any()}
  @spec get_user_group(String.t(), [{:team_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.GetUserGroupResponse.t()} | {:error, any()}
  def get_user_group(id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/usergroups/#{id}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:team_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.GetUserGroupResponse,
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
  Deletes a user group and all its members


  ### Required Arguments:
  - `id`
  ### Optional Arguments:
  - `team_id`
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_user_group(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_user_group(String.t(), [{:team_id, String.t()} | shared_opts]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_user_group(id, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/usergroups/#{id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:team_id]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      200 => ExStreamClient.Model.Response,
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
  Removes members from a user group. Users already not in the group are silently ignored.


  ### Required Arguments:
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.RemoveUserGroupMembersRequest`
  ### Optional Arguments:
  - All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec remove_user_group_members(
          String.t(),
          ExStreamClient.Model.RemoveUserGroupMembersRequest.t()
        ) :: {:ok, ExStreamClient.Model.RemoveUserGroupMembersResponse.t()} | {:error, any()}
  @spec remove_user_group_members(
          String.t(),
          ExStreamClient.Model.RemoveUserGroupMembersRequest.t(),
          shared_opts
        ) :: {:ok, ExStreamClient.Model.RemoveUserGroupMembersResponse.t()} | {:error, any()}
  def remove_user_group_members(id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/usergroups/#{id}/members/delete", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

    response_handlers = %{
      201 => ExStreamClient.Model.RemoveUserGroupMembersResponse,
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
