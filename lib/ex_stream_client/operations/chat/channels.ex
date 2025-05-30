defmodule ExStreamClient.Chat.Channels do
  @moduledoc "
	Modules for interacting with the `chat/channels` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/channels
	"
  require Logger
  @doc ~S"
	Partially channel member update
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: UpdateMemberPartialRequest
	### Optional Arguments:
		- `user_id`
	"
  @spec update_member_partial(
          String.t(),
          String.t(),
          ExStreamClient.Model.UpdateMemberPartialRequest.t()
        ) :: {:ok, ExStreamClient.Model.UpdateMemberPartialResponse.t()} | {:error, any()}
  @spec update_member_partial(
          String.t(),
          String.t(),
          ExStreamClient.Model.UpdateMemberPartialRequest.t(),
          user_id: String.t()
        ) :: {:ok, ExStreamClient.Model.UpdateMemberPartialResponse.t()} | {:error, any()}
  def update_member_partial(type, id, payload, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}/member",
        method: :patch,
        params:
          Keyword.merge([], Keyword.take(opts, [:user_id]))
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
            200 => ExStreamClient.Model.UpdateMemberPartialResponse,
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
	Mark unread
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: MarkUnreadRequest
	"
  @spec mark_unread(String.t(), String.t(), ExStreamClient.Model.MarkUnreadRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def mark_unread(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/unread", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.Response,
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
	Mark channels as read
	
	### Required Arguments:
		- `payload`: MarkChannelsReadRequest
	"
  @spec mark_channels_read(ExStreamClient.Model.MarkChannelsReadRequest.t()) ::
          {:ok, ExStreamClient.Model.MarkReadResponse.t()} | {:error, any()}
  def mark_channels_read(payload) do
    request_opts =
      [url: "/api/v2/chat/channels/read", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.MarkReadResponse,
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
	Hide channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: HideChannelRequest
	"
  @spec hide_channel(String.t(), String.t(), ExStreamClient.Model.HideChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.HideChannelResponse.t()} | {:error, any()}
  def hide_channel(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/hide", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.HideChannelResponse,
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
	Get or create channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: ChannelGetOrCreateRequest
	"
  @spec get_or_create_channel(
          String.t(),
          String.t(),
          ExStreamClient.Model.ChannelGetOrCreateRequest.t()
        ) :: {:ok, ExStreamClient.Model.ChannelStateResponse.t()} | {:error, any()}
  def get_or_create_channel(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/query", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.ChannelStateResponse,
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
	Query channels
	
	### Required Arguments:
		- `payload`: QueryChannelsRequest
	"
  @spec query_channels(ExStreamClient.Model.QueryChannelsRequest.t()) ::
          {:ok, ExStreamClient.Model.QueryChannelsResponse.t()} | {:error, any()}
  def query_channels(payload) do
    request_opts = [url: "/api/v2/chat/channels", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.QueryChannelsResponse,
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
	Send new message
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: SendMessageRequest
	"
  @spec send_message(String.t(), String.t(), ExStreamClient.Model.SendMessageRequest.t()) ::
          {:ok, ExStreamClient.Model.SendMessageResponse.t()} | {:error, any()}
  def send_message(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/message", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.SendMessageResponse,
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
	Truncate channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: TruncateChannelRequest
	"
  @spec truncate_channel(String.t(), String.t(), ExStreamClient.Model.TruncateChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.TruncateChannelResponse.t()} | {:error, any()}
  def truncate_channel(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/truncate", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.TruncateChannelResponse,
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
	Show channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: ShowChannelRequest
	"
  @spec show_channel(String.t(), String.t(), ExStreamClient.Model.ShowChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.ShowChannelResponse.t()} | {:error, any()}
  def show_channel(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/show", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.ShowChannelResponse,
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
	Get many messages
	
	### Required Arguments:
		- `type`
		- `id`
		- `ids`
	"
  @spec get_many_messages(String.t(), String.t(), list()) ::
          {:ok, ExStreamClient.Model.GetManyMessagesResponse.t()} | {:error, any()}
  def get_many_messages(type, id, ids) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/messages", method: :get, params: [ids: ids]] ++
        []

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
            200 => ExStreamClient.Model.GetManyMessagesResponse,
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
	Send event
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: SendEventRequest
	"
  @spec send_event(String.t(), String.t(), ExStreamClient.Model.SendEventRequest.t()) ::
          {:ok, ExStreamClient.Model.EventResponse.t()} | {:error, any()}
  def send_event(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/event", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.EventResponse,
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
	Get draft
	
	### Required Arguments:
		- `type`
		- `id`
	### Optional Arguments:
		- `parent_id`
		- `user_id`
	"
  @spec get_draft(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.GetDraftResponse.t()} | {:error, any()}
  @spec get_draft(String.t(), String.t(), [{:user_id, String.t()} | {:parent_id, String.t()}]) ::
          {:ok, ExStreamClient.Model.GetDraftResponse.t()} | {:error, any()}
  def get_draft(type, id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}/draft",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:parent_id, :user_id]))
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
            200 => ExStreamClient.Model.GetDraftResponse,
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
	Delete draft
	
	### Required Arguments:
		- `type`
		- `id`
	### Optional Arguments:
		- `parent_id`
		- `user_id`
	"
  @spec delete_draft(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_draft(String.t(), String.t(), [{:user_id, String.t()} | {:parent_id, String.t()}]) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_draft(type, id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}/draft",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:parent_id, :user_id]))
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
            200 => ExStreamClient.Model.Response,
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
	Upload file
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: FileUploadRequest
	"
  @spec upload_file(String.t(), String.t(), ExStreamClient.Model.FileUploadRequest.t()) ::
          {:ok, ExStreamClient.Model.FileUploadResponse.t()} | {:error, any()}
  def upload_file(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/file", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.FileUploadResponse,
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
	Delete file
	
	### Required Arguments:
		- `type`
		- `id`
	### Optional Arguments:
		- `url`
	"
  @spec delete_file(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_file(String.t(), String.t(), url: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_file(type, id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}/file",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:url]))
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
            200 => ExStreamClient.Model.Response,
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
	Mark read
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: MarkReadRequest
	"
  @spec mark_read(String.t(), String.t(), ExStreamClient.Model.MarkReadRequest.t()) ::
          {:ok, ExStreamClient.Model.MarkReadResponse.t()} | {:error, any()}
  def mark_read(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/read", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.MarkReadResponse,
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
	Upload image
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: ImageUploadRequest
	"
  @spec upload_image(String.t(), String.t(), ExStreamClient.Model.ImageUploadRequest.t()) ::
          {:ok, ExStreamClient.Model.ImageUploadResponse.t()} | {:error, any()}
  def upload_image(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}/image", method: :post, params: []] ++
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
            201 => ExStreamClient.Model.ImageUploadResponse,
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
	Delete image
	
	### Required Arguments:
		- `type`
		- `id`
	### Optional Arguments:
		- `url`
	"
  @spec delete_image(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_image(String.t(), String.t(), url: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_image(type, id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}/image",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:url]))
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
            200 => ExStreamClient.Model.Response,
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
	Get or create channel
	
	### Required Arguments:
		- `type`
		- `payload`: ChannelGetOrCreateRequest
	"
  @spec get_or_create_distinct_channel(
          String.t(),
          ExStreamClient.Model.ChannelGetOrCreateRequest.t()
        ) :: {:ok, ExStreamClient.Model.ChannelStateResponse.t()} | {:error, any()}
  def get_or_create_distinct_channel(type, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/query", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.ChannelStateResponse,
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
	Update channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: UpdateChannelRequest
	"
  @spec update_channel(String.t(), String.t(), ExStreamClient.Model.UpdateChannelRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateChannelResponse.t()} | {:error, any()}
  def update_channel(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.UpdateChannelResponse,
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
	Partially update channel
	
	### Required Arguments:
		- `type`
		- `id`
		- `payload`: UpdateChannelPartialRequest
	"
  @spec update_channel_partial(
          String.t(),
          String.t(),
          ExStreamClient.Model.UpdateChannelPartialRequest.t()
        ) :: {:ok, ExStreamClient.Model.UpdateChannelPartialResponse.t()} | {:error, any()}
  def update_channel_partial(type, id, payload) do
    request_opts =
      [url: "/api/v2/chat/channels/#{type}/#{id}", method: :patch, params: []] ++ [json: payload]

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
            200 => ExStreamClient.Model.UpdateChannelPartialResponse,
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
	Delete channel
	
	### Required Arguments:
		- `type`
		- `id`
	### Optional Arguments:
		- `hard_delete`
	"
  @spec delete_channel(String.t(), String.t()) ::
          {:ok, ExStreamClient.Model.DeleteChannelResponse.t()} | {:error, any()}
  @spec delete_channel(String.t(), String.t(), hard_delete: boolean()) ::
          {:ok, ExStreamClient.Model.DeleteChannelResponse.t()} | {:error, any()}
  def delete_channel(type, id, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/chat/channels/#{type}/#{id}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:hard_delete]))
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
            200 => ExStreamClient.Model.DeleteChannelResponse,
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
	Deletes channels asynchronously
	
	### Required Arguments:
		- `payload`: DeleteChannelsRequest
	"
  @spec delete_channels(ExStreamClient.Model.DeleteChannelsRequest.t()) ::
          {:ok, ExStreamClient.Model.DeleteChannelsResponse.t()} | {:error, any()}
  def delete_channels(payload) do
    request_opts =
      [url: "/api/v2/chat/channels/delete", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.DeleteChannelsResponse,
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
