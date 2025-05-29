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
    request_opts = [url: "/api/v2/imports/#{id}", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "GetImportResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
    request_opts = [url: "/api/v2/imports", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateImportResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
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
    request_opts = [url: "/api/v2/imports", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ListImportsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end