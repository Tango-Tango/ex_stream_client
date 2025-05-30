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
      [url: "/api/v2/roles", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateRoleResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	List roles
	
	### Required Arguments:
		
	"
  @spec list_roles() :: {:ok, ExStreamClient.Model.ListRolesResponse.t()} | {:error, any()}
  def list_roles() do
    request_opts =
      [url: "/api/v2/roles", method: :get, params: %{}, decode_json: [keys: :atoms]] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListRolesResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete role
	
	### Required Arguments:
		- `name`
	"
  @spec delete_role(String.t()) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_role(name) do
    request_opts =
      [url: "/api/v2/roles/#{name}", method: :delete, params: %{}, decode_json: [keys: :atoms]] ++
        []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.Response,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end
end
