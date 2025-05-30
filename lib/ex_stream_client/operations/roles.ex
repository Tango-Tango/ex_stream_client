defmodule ExStreamClient.Roles do
  @moduledoc "
	Modules for interacting with the `roles` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/roles
	"
  require Logger
  @doc ~S"
	Create role
	
	### Required Arguments:
		- `payload`: CreateRoleRequest
	"
  @spec create_role(ExStreamClient.Model.CreateRoleRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateRoleResponse.t()} | {:error, any()}
  def create_role(payload) do
    request_opts =
      [url: "/api/v2/roles", method: :post, params: [], decode_json: [keys: :atoms]] ++
        [json: payload]

    response_handlers = %{
      201 => ExStreamClient.Model.CreateRoleResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	List roles
	
	### Required Arguments:
		
	"
  @spec list_roles() :: {:ok, ExStreamClient.Model.ListRolesResponse.t()} | {:error, any()}
  def list_roles() do
    request_opts =
      [url: "/api/v2/roles", method: :get, params: [], decode_json: [keys: :atoms]] ++ []

    response_handlers = %{
      200 => ExStreamClient.Model.ListRolesResponse,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Delete role
	
	### Required Arguments:
		- `name`
	"
  @spec delete_role(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_role(name) do
    request_opts =
      [url: "/api/v2/roles/#{name}", method: :delete, params: [], decode_json: [keys: :atoms]] ++
        []

    response_handlers = %{
      200 => ExStreamClient.Model.Response,
      400 => ExStreamClient.Model.APIError,
      429 => ExStreamClient.Model.APIError
    }

    response_handlers |> Map.values() |> Code.ensure_all_loaded()

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

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
