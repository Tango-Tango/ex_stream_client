defmodule ExStreamClient.Operations.Users do
  @moduledoc "
	Modules for interacting with the `users` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/users
	"
  require Logger
  @doc ~S"
	Activates user who's been deactivated previously

Sends events:
- user.reactivated

	
	### Required Arguments:
		- `user_id`
		- `payload`: ReactivateUserRequest
	"
  @spec reactivate_user(String.t(), ExStreamClient.Model.ReactivateUserRequest.t()) ::
          {:ok, ExStreamClient.Model.ReactivateUserResponse.t()} | {:error, any()}
  def reactivate_user(user_id, payload) do
    request_opts =
      [url: "/api/v2/users/#{user_id}/reactivate", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.ReactivateUserResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Update or create users in bulk

Sends events:
- user.updated

	
	### Required Arguments:
		- `payload`: UpdateUsersRequest
	"
  @spec update_users(ExStreamClient.Model.UpdateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  def update_users(payload) do
    request_opts = [url: "/api/v2/users", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Updates certain fields of the user

Sends events:
- user.presence.changed
- user.updated
- user.presence.changed

	
	### Required Arguments:
		- `payload`: UpdateUsersPartialRequest
	"
  @spec update_users_partial(ExStreamClient.Model.UpdateUsersPartialRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateUsersResponse.t()} | {:error, any()}
  def update_users_partial(payload) do
    request_opts = [url: "/api/v2/users", method: :patch, params: []] ++ [json: payload]

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
            200 => ExStreamClient.Model.UpdateUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Find and filter users

	
	### Required Arguments:
		
	### Optional Arguments:
		- `payload`: QueryUsersPayload
	"
  @spec query_users() :: {:ok, ExStreamClient.Model.QueryUsersResponse.t()} | {:error, any()}
  @spec query_users(payload: ExStreamClient.Model.QueryUsersPayload.t()) ::
          {:ok, ExStreamClient.Model.QueryUsersResponse.t()} | {:error, any()}
  def query_users(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/users",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
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
            200 => ExStreamClient.Model.QueryUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deletes users and optionally all their belongings asynchronously.

Sends events:
- channel.deleted
- user.deleted

	
	### Required Arguments:
		- `payload`: DeleteUsersRequest
	"
  @spec delete_users(ExStreamClient.Model.DeleteUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.DeleteUsersResponse.t()} | {:error, any()}
  def delete_users(payload) do
    request_opts = [url: "/api/v2/users/delete", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.DeleteUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Reactivate users in batches

Sends events:
- user.reactivated
- user.reactivated

	
	### Required Arguments:
		- `payload`: ReactivateUsersRequest
	"
  @spec reactivate_users(ExStreamClient.Model.ReactivateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.ReactivateUsersResponse.t()} | {:error, any()}
  def reactivate_users(payload) do
    request_opts = [url: "/api/v2/users/reactivate", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.ReactivateUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Exports the user's profile, reactions and messages. Raises an error if a user has more than 10k messages or reactions

	
	### Required Arguments:
		- `user_id`
	"
  @spec export_user(String.t()) ::
          {:ok, ExStreamClient.Model.ExportUserResponse.t()} | {:error, any()}
  def export_user(user_id) do
    request_opts = [url: "/api/v2/users/#{user_id}/export", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ExportUserResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deactivate users in batches

Sends events:
- user.deactivated

	
	### Required Arguments:
		- `payload`: DeactivateUsersRequest
	"
  @spec deactivate_users(ExStreamClient.Model.DeactivateUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.DeactivateUsersResponse.t()} | {:error, any()}
  def deactivate_users(payload) do
    request_opts = [url: "/api/v2/users/deactivate", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.DeactivateUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Restore soft deleted users

	
	### Required Arguments:
		- `payload`: RestoreUsersRequest
	"
  @spec restore_users(ExStreamClient.Model.RestoreUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def restore_users(payload) do
    request_opts = [url: "/api/v2/users/restore", method: :post, params: []] ++ [json: payload]

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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Unblock users

	
	### Required Arguments:
		- `payload`: UnblockUsersRequest
	"
  @spec unblock_users(ExStreamClient.Model.UnblockUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.UnblockUsersResponse.t()} | {:error, any()}
  def unblock_users(payload) do
    request_opts = [url: "/api/v2/users/unblock", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UnblockUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Block users

	
	### Required Arguments:
		- `payload`: BlockUsersRequest
	"
  @spec block_users(ExStreamClient.Model.BlockUsersRequest.t()) ::
          {:ok, ExStreamClient.Model.BlockUsersResponse.t()} | {:error, any()}
  def block_users(payload) do
    request_opts = [url: "/api/v2/users/block", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.BlockUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Get list of blocked Users

	
	### Required Arguments:
		
	### Optional Arguments:
		- `user_id`
	"
  @spec get_blocked_users() ::
          {:ok, ExStreamClient.Model.GetBlockedUsersResponse.t()} | {:error, any()}
  @spec get_blocked_users(user_id: String.t()) ::
          {:ok, ExStreamClient.Model.GetBlockedUsersResponse.t()} | {:error, any()}
  def get_blocked_users(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/users/block",
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
            200 => ExStreamClient.Model.GetBlockedUsersResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Deactivates user with possibility to activate it back

Sends events:
- user.deactivated

	
	### Required Arguments:
		- `user_id`
		- `payload`: DeactivateUserRequest
	"
  @spec deactivate_user(String.t(), ExStreamClient.Model.DeactivateUserRequest.t()) ::
          {:ok, ExStreamClient.Model.DeactivateUserResponse.t()} | {:error, any()}
  def deactivate_user(user_id, payload) do
    request_opts =
      [url: "/api/v2/users/#{user_id}/deactivate", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.DeactivateUserResponse,
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
