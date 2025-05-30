defmodule ExStreamClient.Moderation do
  @moduledoc "
	Modules for interacting with the `moderation` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/moderation
	"
  require Logger
  @doc ~S"
	Custom check endpoint
	
	### Required Arguments:
		- `payload`: CustomCheckRequest
	"
  @spec custom_check(ExStreamClient.Model.CustomCheckRequest.t()) ::
          {:ok, ExStreamClient.Model.CustomCheckResponse.t()} | {:error, any()}
  def custom_check(payload) do
    request_opts =
      [url: "/api/v2/moderation/custom_check", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CustomCheckResponse,
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
	Unban
	
	### Required Arguments:
		- `target_user_id`
		- `payload`: UnbanRequest
	### Optional Arguments:
		- `channel_cid`
		- `created_by`
	"
  @spec unban(String.t(), ExStreamClient.Model.UnbanRequest.t()) ::
          {:ok, ExStreamClient.Model.UnbanResponse.t()} | {:error, any()}
  @spec unban(String.t(), ExStreamClient.Model.UnbanRequest.t(), [
          {:created_by, String.t()} | {:channel_cid, String.t()}
        ]) :: {:ok, ExStreamClient.Model.UnbanResponse.t()} | {:error, any()}
  def unban(target_user_id, payload, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/moderation/unban",
        method: :post,
        params:
          Keyword.merge(
            [target_user_id: target_user_id],
            Keyword.take(opts, [:channel_cid, :created_by])
          )
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ [json: payload]

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
            201 => ExStreamClient.Model.UnbanResponse,
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
	Submit moderation action
	
	### Required Arguments:
		- `payload`: SubmitActionRequest
	"
  @spec submit_action(ExStreamClient.Model.SubmitActionRequest.t()) ::
          {:ok, ExStreamClient.Model.SubmitActionResponse.t()} | {:error, any()}
  def submit_action(payload) do
    request_opts =
      [url: "/api/v2/moderation/submit_action", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.SubmitActionResponse,
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
	Unmute a user
	
	### Required Arguments:
		- `payload`: UnmuteRequest
	"
  @spec unmute(ExStreamClient.Model.UnmuteRequest.t()) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  def unmute(payload) do
    request_opts =
      [url: "/api/v2/moderation/unmute", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UnmuteResponse,
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
	Query moderation configurations
	
	### Required Arguments:
		- `payload`: QueryModerationConfigsRequest
	"
  @spec query_moderation_configs(ExStreamClient.Model.QueryModerationConfigsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationConfigsResponse.t()} | {:error, any()}
  def query_moderation_configs(payload) do
    request_opts =
      [url: "/api/v2/moderation/configs", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryModerationConfigsResponse,
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
	Get review queue item
	
	### Required Arguments:
		- `id`
	"
  @spec get_review_queue_item(String.t()) ::
          {:ok, ExStreamClient.Model.GetReviewQueueItemResponse.t()} | {:error, any()}
  def get_review_queue_item(id) do
    request_opts = [url: "/api/v2/moderation/review_queue/#{id}", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.GetReviewQueueItemResponse,
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
	Bulk image moderation
	
	### Required Arguments:
		- `payload`: BulkImageModerationRequest
	"
  @spec bulk_image_moderation(ExStreamClient.Model.BulkImageModerationRequest.t()) ::
          {:ok, ExStreamClient.Model.BulkImageModerationResponse.t()} | {:error, any()}
  def bulk_image_moderation(payload) do
    request_opts =
      [url: "/api/v2/moderation/bulk_image_moderation", method: :post, params: []] ++
        [json: payload]

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
            201 => ExStreamClient.Model.BulkImageModerationResponse,
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
	Query moderation action logs
	
	### Required Arguments:
		- `payload`: QueryModerationLogsRequest
	"
  @spec query_moderation_logs(ExStreamClient.Model.QueryModerationLogsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationLogsResponse.t()} | {:error, any()}
  def query_moderation_logs(payload) do
    request_opts = [url: "/api/v2/moderation/logs", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryModerationLogsResponse,
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
	Upsert feeds template
	
	### Required Arguments:
		- `payload`: UpsertModerationTemplateRequest
	"
  @spec v2_upsert_template(ExStreamClient.Model.UpsertModerationTemplateRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertModerationTemplateResponse.t()} | {:error, any()}
  def v2_upsert_template(payload) do
    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :post, params: []] ++
        [json: payload]

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
            201 => ExStreamClient.Model.UpsertModerationTemplateResponse,
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
	Query feed moderation templates
	
	### Required Arguments:
		
	"
  @spec v2_query_templates() ::
          {:ok, ExStreamClient.Model.QueryFeedModerationTemplatesResponse.t()} | {:error, any()}
  def v2_query_templates() do
    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :get, params: []] ++ []

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
            200 => ExStreamClient.Model.QueryFeedModerationTemplatesResponse,
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
	Delete a moderation template
	
	### Required Arguments:
		
	"
  @spec v2_delete_template() ::
          {:ok, ExStreamClient.Model.DeleteModerationTemplateResponse.t()} | {:error, any()}
  def v2_delete_template() do
    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :delete, params: []] ++ []

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
            200 => ExStreamClient.Model.DeleteModerationTemplateResponse,
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
	Mute
	
	### Required Arguments:
		- `payload`: MuteRequest
	"
  @spec mute(ExStreamClient.Model.MuteRequest.t()) ::
          {:ok, ExStreamClient.Model.MuteResponse.t()} | {:error, any()}
  def mute(payload) do
    request_opts = [url: "/api/v2/moderation/mute", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.MuteResponse,
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
	Ban
	
	### Required Arguments:
		- `payload`: BanRequest
	"
  @spec ban(ExStreamClient.Model.BanRequest.t()) ::
          {:ok, ExStreamClient.Model.BanResponse.t()} | {:error, any()}
  def ban(payload) do
    request_opts = [url: "/api/v2/moderation/ban", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.BanResponse,
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
	Create or update moderation configuration
	
	### Required Arguments:
		- `payload`: UpsertConfigRequest
	"
  @spec upsert_config(ExStreamClient.Model.UpsertConfigRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertConfigResponse.t()} | {:error, any()}
  def upsert_config(payload) do
    request_opts =
      [url: "/api/v2/moderation/config", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpsertConfigResponse,
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
	Query review queue items
	
	### Required Arguments:
		- `payload`: QueryReviewQueueRequest
	"
  @spec query_review_queue(ExStreamClient.Model.QueryReviewQueueRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryReviewQueueResponse.t()} | {:error, any()}
  def query_review_queue(payload) do
    request_opts =
      [url: "/api/v2/moderation/review_queue", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryReviewQueueResponse,
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
	Get moderation configuration
	
	### Required Arguments:
		- `key`
	### Optional Arguments:
		- `team`
	"
  @spec get_config(String.t()) ::
          {:ok, ExStreamClient.Model.GetConfigResponse.t()} | {:error, any()}
  @spec get_config(String.t(), team: String.t()) ::
          {:ok, ExStreamClient.Model.GetConfigResponse.t()} | {:error, any()}
  def get_config(key, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/moderation/config/#{key}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:team]))
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
            200 => ExStreamClient.Model.GetConfigResponse,
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
	Delete a moderation policy
	
	### Required Arguments:
		- `key`
	### Optional Arguments:
		- `team`
	"
  @spec delete_config(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteModerationConfigResponse.t()} | {:error, any()}
  @spec delete_config(String.t(), team: String.t()) ::
          {:ok, ExStreamClient.Model.DeleteModerationConfigResponse.t()} | {:error, any()}
  def delete_config(key, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/moderation/config/#{key}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:team]))
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
            200 => ExStreamClient.Model.DeleteModerationConfigResponse,
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
	Query moderation flags
	
	### Required Arguments:
		- `payload`: QueryModerationFlagsRequest
	"
  @spec query_moderation_flags(ExStreamClient.Model.QueryModerationFlagsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationFlagsResponse.t()} | {:error, any()}
  def query_moderation_flags(payload) do
    request_opts = [url: "/api/v2/moderation/flags", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryModerationFlagsResponse,
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
	Flag content for moderation
	
	### Required Arguments:
		- `payload`: FlagRequest
	"
  @spec flag(ExStreamClient.Model.FlagRequest.t()) ::
          {:ok, ExStreamClient.Model.FlagResponse.t()} | {:error, any()}
  def flag(payload) do
    request_opts = [url: "/api/v2/moderation/flag", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.FlagResponse,
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
	Check
	
	### Required Arguments:
		- `payload`: CheckRequest
	"
  @spec check(ExStreamClient.Model.CheckRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckResponse.t()} | {:error, any()}
  def check(payload) do
    request_opts = [url: "/api/v2/moderation/check", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CheckResponse,
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
