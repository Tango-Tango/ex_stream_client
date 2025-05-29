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
    request_opts = [url: "/api/v2/roles", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "CreateRoleResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
    request_opts = [url: "/api/v2/roles", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "ListRolesResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
    request_opts = [url: "/api/v2/roles/#{name}", method: :delete, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end