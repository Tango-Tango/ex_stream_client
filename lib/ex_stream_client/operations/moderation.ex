defmodule ExStreamClient.Operations.Moderation do
  @moduledoc ~S"""
  Modules for interacting with the `moderation` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2


  ### Shared options
  All functions in this module accept the following optional parameters:

   * `api_key` - API key to use. If not provided, the default key from config will be used
   * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used
   * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used
   * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`
   * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options
  """
  require Logger

  @doc ~S"""
  Custom check, add your own AI model reports to the review queue


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CustomCheckRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec custom_check(ExStreamClient.Model.CustomCheckRequest.t()) ::
          {:ok, ExStreamClient.Model.CustomCheckResponse.t()} | {:error, any()}
  def custom_check(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/custom_check", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Unban a user from a channel or globally.


  ### Required Arguments:
  - `target_user_id`
  - `payload`: `Elixir.ExStreamClient.Model.UnbanRequest`
  ### Optional Arguments:
  - `channel_cid`
  - `created_by`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec unban(String.t(), ExStreamClient.Model.UnbanRequest.t()) ::
          {:ok, ExStreamClient.Model.UnbanResponse.t()} | {:error, any()}
  @spec unban(String.t(), ExStreamClient.Model.UnbanRequest.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:payload, ExStreamClient.Model.UnbanRequest.t()}
          | {:target_user_id, String.t()}
        ]) :: {:ok, ExStreamClient.Model.UnbanResponse.t()} | {:error, any()}
  def unban(target_user_id, payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/moderation/unban",
        method: :post,
        params:
          Keyword.merge([target_user_id: target_user_id], Keyword.take(opts, []))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Take action on flagged content, such as marking content as safe, deleting content, banning users, or executing custom moderation actions. Supports various action types with configurable parameters.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.SubmitActionRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec submit_action(ExStreamClient.Model.SubmitActionRequest.t()) ::
          {:ok, ExStreamClient.Model.SubmitActionResponse.t()} | {:error, any()}
  def submit_action(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/submit_action", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Unmute a user


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UnmuteRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec unmute(ExStreamClient.Model.UnmuteRequest.t()) ::
          {:ok, ExStreamClient.Model.UnmuteResponse.t()} | {:error, any()}
  def unmute(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/unmute", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Search and filter moderation configurations across your application. This endpoint is designed for building moderation dashboards and managing multiple configuration sets.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryModerationConfigsRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_moderation_configs(ExStreamClient.Model.QueryModerationConfigsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationConfigsResponse.t()} | {:error, any()}
  def query_moderation_configs(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/configs", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieve a specific review queue item by its ID


  ### Required Arguments:
  - `id`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_review_queue_item(String.t()) ::
          {:ok, ExStreamClient.Model.GetReviewQueueItemResponse.t()} | {:error, any()}
  def get_review_queue_item(id, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/review_queue/#{id}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Moderate multiple images in bulk using a CSV file


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.BulkImageModerationRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec bulk_image_moderation(ExStreamClient.Model.BulkImageModerationRequest.t()) ::
          {:ok, ExStreamClient.Model.BulkImageModerationResponse.t()} | {:error, any()}
  def bulk_image_moderation(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/bulk_image_moderation", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Search and filter moderation action logs with support for pagination. View the history of moderation actions taken, including who performed them and when.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryModerationLogsRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_moderation_logs(ExStreamClient.Model.QueryModerationLogsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationLogsResponse.t()} | {:error, any()}
  def query_moderation_logs(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/logs", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Upsert feeds template for moderation


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertModerationTemplateRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec v2_upsert_template(ExStreamClient.Model.UpsertModerationTemplateRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertModerationTemplateResponse.t()} | {:error, any()}
  def v2_upsert_template(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :post, params: []] ++
        [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieve a list of feed moderation templates that define preset moderation rules and configurations. Limited to 100 templates per request.



  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec v2_query_templates() ::
          {:ok, ExStreamClient.Model.QueryFeedModerationTemplatesResponse.t()} | {:error, any()}
  def v2_query_templates(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :get, params: []] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Delete a specific moderation template by its name



  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec v2_delete_template() ::
          {:ok, ExStreamClient.Model.DeleteModerationTemplateResponse.t()} | {:error, any()}
  def v2_delete_template(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/feeds_moderation_template", method: :delete, params: []] ++ []

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Mute a user. Mutes are generally not visible to the user you mute, while block is something you notice.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.MuteRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec mute(ExStreamClient.Model.MuteRequest.t()) ::
          {:ok, ExStreamClient.Model.MuteResponse.t()} | {:error, any()}
  def mute(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/mute", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Ban a user from a channel or the entire app


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.BanRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec ban(ExStreamClient.Model.BanRequest.t()) ::
          {:ok, ExStreamClient.Model.BanResponse.t()} | {:error, any()}
  def ban(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/ban", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Create a new moderation configuration or update an existing one. Configure settings for content filtering, AI analysis, toxicity detection, and other moderation features.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.UpsertConfigRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec upsert_config(ExStreamClient.Model.UpsertConfigRequest.t()) ::
          {:ok, ExStreamClient.Model.UpsertConfigResponse.t()} | {:error, any()}
  def upsert_config(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/config", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Query review queue items allows you to filter the review queue items. This is used for building a moderation dashboard.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryReviewQueueRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_review_queue(ExStreamClient.Model.QueryReviewQueueRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryReviewQueueResponse.t()} | {:error, any()}
  def query_review_queue(payload, opts \\ []) do
    client = get_client(opts)

    request_opts =
      [url: "/api/v2/moderation/review_queue", method: :post, params: []] ++ [json: payload]

    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Retrieve a specific moderation configuration by its key and team. This configuration contains settings for various moderation features like toxicity detection, AI analysis, and filtering rules.


  ### Required Arguments:
  - `key`
  ### Optional Arguments:
  - `team`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec get_config(String.t()) ::
          {:ok, ExStreamClient.Model.GetConfigResponse.t()} | {:error, any()}
  @spec get_config(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:key, String.t()}
        ]) :: {:ok, ExStreamClient.Model.GetConfigResponse.t()} | {:error, any()}
  def get_config(key, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/config/#{key}", method: :get, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Delete a specific moderation policy by its name


  ### Required Arguments:
  - `key`
  ### Optional Arguments:
  - `team`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec delete_config(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteModerationConfigResponse.t()} | {:error, any()}
  @spec delete_config(String.t(), [
          {:req_opts, keyword()}
          | {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:key, String.t()}
        ]) :: {:ok, ExStreamClient.Model.DeleteModerationConfigResponse.t()} | {:error, any()}
  def delete_config(key, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/config/#{key}", method: :delete, params: []] ++ []
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Query flags associated with moderation items. This is used for building a moderation dashboard.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryModerationFlagsRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec query_moderation_flags(ExStreamClient.Model.QueryModerationFlagsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryModerationFlagsResponse.t()} | {:error, any()}
  def query_moderation_flags(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/flags", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Flag any type of content (messages, users, channels, activities) for moderation review. Supports custom content types and additional metadata for flagged content.


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.FlagRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec flag(ExStreamClient.Model.FlagRequest.t()) ::
          {:ok, ExStreamClient.Model.FlagResponse.t()} | {:error, any()}
  def flag(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/flag", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Run moderation checks on the provided content


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CheckRequest`

  All options from [Shared Options](#module-shared-options) are supported.
  """
  @spec check(ExStreamClient.Model.CheckRequest.t()) ::
          {:ok, ExStreamClient.Model.CheckResponse.t()} | {:error, any()}
  def check(payload, opts \\ []) do
    client = get_client(opts)
    request_opts = [url: "/api/v2/moderation/check", method: :post, params: []] ++ [json: payload]
    request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
