defmodule ExStreamClient.Chat.PushTemplates do
  @moduledoc "
	Modules for interacting with the `chat/push_templates` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/push_templates
	"
  require Logger
  @doc ~S"
	Upsert a push notification template
	
	### Required Arguments:
		- `payload`: UpsertPushTemplateRequest
	"
  @spec upsert_push_template(ExStreamClient.Model.UpsertPushTemplateRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertPushTemplateResponse.t()} | {:error, any()}
  def upsert_push_template(payload) do
    request_opts =
      [url: "/api/v2/chat/push_templates", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpsertPushTemplateResponse,
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"
	Get push notification templates
	
	### Required Arguments:
		- `push_provider_type`
	### Optional Arguments:
		- `push_provider_name`
	"
  @spec get_push_templates(String.t()) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  @spec get_push_templates(String.t(), push_provider_name: String.t()) ::
          {:ok, ExStreamClient.Model.GetPushTemplatesResponse.t()} | {:error, any()}
  def get_push_templates(push_provider_type, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/push_templates",
        method: :get,
        params:
          Keyword.merge(
            [push_provider_type: push_provider_type],
            Keyword.take(opts, [:push_provider_name])
          )
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
            200 => ExStreamClient.Model.GetPushTemplatesResponse,
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

    case ExStreamClient.Client.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
