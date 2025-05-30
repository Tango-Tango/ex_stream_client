defmodule ExStreamClient.Imports do
  @moduledoc "
	Modules for interacting with the `imports` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/imports
	"
  require Logger
  @doc ~S"
	Get import
	
	### Required Arguments:
		- `id`
	"
  @spec get_import(String.t()) ::
          {:ok, ExStreamClient.Model.GetImportResponse.t()} | {:error, any()}
  def get_import(id) do
    request_opts =
      [url: "/api/v2/imports/#{id}", method: :get, params: %{}, decode_json: [keys: :atoms]] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetImportResponse,
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
	Create import
	
	### Required Arguments:
		- `payload`: CreateImportRequest
	"
  @spec create_import(ExStreamClient.Model.CreateImportRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportResponse.t()} | {:error, any()}
  def create_import(payload) do
    request_opts =
      [url: "/api/v2/imports", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateImportResponse,
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
	Get import
	
	### Required Arguments:
		
	"
  @spec list_imports() :: {:ok, ExStreamClient.Model.ListImportsResponse.t()} | {:error, any()}
  def list_imports() do
    request_opts =
      [url: "/api/v2/imports", method: :get, params: %{}, decode_json: [keys: :atoms]] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListImportsResponse,
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
