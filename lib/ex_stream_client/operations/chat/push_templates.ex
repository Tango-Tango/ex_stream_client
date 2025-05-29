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
      [url: "/api/v2/chat/push_templates", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpsertPushTemplateResponse"}
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetPushTemplatesResponse"}
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