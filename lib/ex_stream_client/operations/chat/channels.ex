defmodule ExStreamClient.Operations.Chat.Channels do
  @moduledoc ~S"""
  Modules for interacting with the `chat/channels` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""



  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateMemberPartialRequest`
  ### Optional Arguments:
  - `user_id`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Marks channel as unread from a specific message


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.MarkUnreadRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Marks channels as read up to the specific message. If no channels is given, mark all channel as read

  ### Sends events:
  - `message.read`
  - `message.read`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.MarkChannelsReadRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Marks channel as hidden for current user

  ### Sends events:
  - `channel.hidden`
  - `channel.hidden`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.HideChannelRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  This Method creates a channel or returns an existing one with matching attributes

  ### Sends events:
  - `channel.created`
  - `member.added`
  - `member.removed`
  - `member.updated`
  - `user.watching.start`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.ChannelGetOrCreateRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Query channels with filter query


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.QueryChannelsRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Sends new message to the specified channel

  ### Sends events:
  - `message.new`
  - `message.updated`
  - `message.new`
  - `message.updated`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.SendMessageRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Truncates messages from a channel. Can be applied to the entire channel or scoped to specific members.

  ### Sends events:
  - `channel.truncated`
  - `channel.truncated`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.TruncateChannelRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Shows previously hidden channel

  ### Sends events:
  - `channel.visible`
  - `channel.visible`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.ShowChannelRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Returns list messages found by IDs


  ### Required Arguments:
  - `type`
  - `id`
  - `ids`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Sends event to the channel


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.SendEventRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Get a draft


  ### Required Arguments:
  - `type`
  - `id`
  ### Optional Arguments:
  - `parent_id`
  - `user_id`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes a draft

  ### Sends events:
  - `draft.deleted`


  ### Required Arguments:
  - `type`
  - `id`
  ### Optional Arguments:
  - `parent_id`
  - `user_id`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Uploads file


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.FileUploadRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes previously uploaded file


  ### Required Arguments:
  - `type`
  - `id`
  ### Optional Arguments:
  - `url`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Marks channel as read up to the specific message

  ### Sends events:
  - `message.read`
  - `message.read`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.MarkReadRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Uploads image


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.ImageUploadRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes previously uploaded image


  ### Required Arguments:
  - `type`
  - `id`
  ### Optional Arguments:
  - `url`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  This Method creates a channel or returns an existing one with matching attributes

  ### Sends events:
  - `channel.created`
  - `member.added`
  - `member.removed`
  - `member.updated`
  - `user.watching.start`


  ### Required Arguments:
  - `type`
  - `payload`: `Elixir.ExStreamClient.Model.ChannelGetOrCreateRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Change channel data

  ### Sends events:
  - `channel.updated`
  - `member.added`
  - `member.removed`
  - `member.updated`
  - `message.new`
  - `channel.updated`
  - `member.added`
  - `member.removed`
  - `member.updated`
  - `message.new`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateChannelRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Updates certain fields of the channel

  ### Sends events:
  - `channel.updated`
  - `channel.updated`


  ### Required Arguments:
  - `type`
  - `id`
  - `payload`: `Elixir.ExStreamClient.Model.UpdateChannelPartialRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Deletes channel

  ### Sends events:
  - `channel.deleted`
  - `channel.deleted`


  ### Required Arguments:
  - `type`
  - `id`
  ### Optional Arguments:
  - `hard_delete`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  @doc ~S"""
  Allows to delete several channels at once asynchronously

  ### Sends events:
  - `channel.deleted`
  - `channel.deleted`


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.DeleteChannelsRequest`
  """
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

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
