defmodule ExStreamClient.Permissions do
  @moduledoc "
	Modules for interacting with the `permissions` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/permissions
	"
  require Logger
  @doc ~S"
	List permissions
	
	### Required Arguments:
		
	"
  @spec list_permissions() ::
          {:ok, ExStreamClient.Model.ListPermissionsResponse.t()} | {:error, any()}
  def list_permissions() do
    request_opts =
      [url: "/api/v2/permissions", method: :get, params: [], decode_json: [keys: :atoms]] ++ []

    response_handlers = %{
      200 => ExStreamClient.Model.ListPermissionsResponse,
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
	Get permission
	
	### Required Arguments:
		- `id`
	"
  @spec get_permission(String.t()) ::
          {:ok, ExStreamClient.Model.GetCustomPermissionResponse.t()} | {:error, any()}
  def get_permission(id) do
    request_opts =
      [url: "/api/v2/permissions/#{id}", method: :get, params: [], decode_json: [keys: :atoms]] ++
        []

    response_handlers = %{
      200 => ExStreamClient.Model.GetCustomPermissionResponse,
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
