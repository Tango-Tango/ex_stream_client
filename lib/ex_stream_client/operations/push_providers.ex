defmodule ExStreamClient.PushProviders do
  @moduledoc "
	Modules for interacting with the `push_providers` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/push_providers
	"
  require Logger
  @doc ~S"
	Delete a push provider
	
	### Required Arguments:
		- `type`
		- `name`
	"
  @spec delete_push_provider(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_push_provider(type, name) do
    request_opts =
      [
        url: "/api/v2/push_providers/#{type}/#{name}",
        method: :delete,
        params: %{},
        decode_json: [keys: :atoms]
      ] ++ []

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

  @doc ~S"
	Upsert a push provider
	
	### Required Arguments:
		- `payload`: UpsertPushProviderRequest
	"
  @spec upsert_push_provider(ExStreamClient.Model.UpsertPushProviderRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertPushProviderResponse.t()} | {:error, any()}
  def upsert_push_provider(payload) do
    request_opts =
      [url: "/api/v2/push_providers", method: :post, params: %{}, decode_json: [keys: :atoms]] ++
        [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            201 => ExStreamClient.Model.UpsertPushProviderResponse,
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
	List push providers
	
	### Required Arguments:
		
	"
  @spec list_push_providers() ::
          {:ok, ExStreamClient.Model.ListPushProvidersResponse.t()} | {:error, any()}
  def list_push_providers() do
    request_opts =
      [url: "/api/v2/push_providers", method: :get, params: %{}, decode_json: [keys: :atoms]] ++
        []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.ListPushProvidersResponse,
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
