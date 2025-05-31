defmodule ExStreamClient.Operations.Imports do
  @moduledoc "
	Modules for interacting with the `imports` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/imports
	"
  require Logger
  @doc ~S"
	Gets an import

	
	### Required Arguments:
		- `id`
	"
  @spec get_import(String.t()) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  def get_import(id) do
    request_opts = [url: "/api/v2/imports/#{id}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetImportResponse,
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
	Creates a new import

	
	### Required Arguments:
		- `payload`: CreateImportRequest
	"
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  def create_import(payload) do
    request_opts = [url: "/api/v2/imports", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateImportResponse,
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
	Gets an import

	
	### Required Arguments:
		
	"
  @spec list_imports() :: {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  def list_imports() do
    request_opts = [url: "/api/v2/imports", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.ListImportsResponse,
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
