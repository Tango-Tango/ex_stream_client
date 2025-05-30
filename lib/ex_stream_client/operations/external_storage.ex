defmodule ExStreamClient.ExternalStorage do
  @moduledoc "
	Modules for interacting with the `external_storage` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/external_storage
	"
  require Logger
  @doc ~S"
	Check External Storage
	
	### Required Arguments:
		- `name`
	"
  @spec check_external_storage(String.t()) ::
          {:ok, ExStreamClient.Model.CheckExternalStorageResponse.t()} | {:error, any()}
  def check_external_storage(name) do
    request_opts =
      [
        url: "/api/v2/external_storage/#{name}/check",
        method: :get,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.CheckExternalStorageResponse,
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
	Create external storage
	
	### Required Arguments:
		- `payload`: CreateExternalStorageRequest
	"
  @spec create_external_storage(ExStreamClient.Model.CreateExternalStorageRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateExternalStorageResponse.t()} | {:error, any()}
  def create_external_storage(payload) do
    request_opts =
      [url: "/api/v2/external_storage", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.CreateExternalStorageResponse,
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
	List external storage
	
	### Required Arguments:
		
	"
  @spec list_external_storage() ::
          {:ok, ExStreamClient.Model.ListExternalStorageResponse.t()} | {:error, any()}
  def list_external_storage() do
    request_opts =
      [url: "/api/v2/external_storage", method: :get, params: %{}, decode_json: [keys: :atoms]] ++
        []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListExternalStorageResponse,
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
	Update External Storage
	
	### Required Arguments:
		- `name`
		- `payload`: UpdateExternalStorageRequest
	"
  @spec update_external_storage(String.t(), ExStreamClient.Model.UpdateExternalStorageRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateExternalStorageResponse.t()} | {:error, any()}
  def update_external_storage(name, payload) do
    request_opts =
      [
        url: "/api/v2/external_storage/#{name}",
        method: :put,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpdateExternalStorageResponse,
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
	Delete external storage
	
	### Required Arguments:
		- `name`
	"
  @spec delete_external_storage(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteExternalStorageResponse.t()} | {:error, any()}
  def delete_external_storage(name) do
    request_opts =
      [
        url: "/api/v2/external_storage/#{name}",
        method: :delete,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.DeleteExternalStorageResponse,
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
