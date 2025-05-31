defmodule ExStreamClient.Model.NotificationMarkUnreadEvent do
  @moduledoc "Schema representing a NotificationMarkUnreadEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :first_unread_message_id,
    :last_read_at,
    :total_unread_count,
    :type,
    :unread_channels,
    :unread_count,
    :unread_messages,
    :unread_threads
  ]
  defstruct [
    :channel,
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :first_unread_message_id,
    :last_read_at,
    :last_read_message_id,
    :team,
    :thread_id,
    :total_unread_count,
    :type,
    :unread_channels,
    :unread_count,
    :unread_messages,
    :unread_threads,
    :user
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t(),
          channel_member_count: integer(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          first_unread_message_id: String.t(),
          last_read_at: float(),
          last_read_message_id: String.t() | nil,
          team: String.t() | nil,
          thread_id: String.t() | nil,
          total_unread_count: integer(),
          type: String.t(),
          unread_channels: integer(),
          unread_count: integer(),
          unread_messages: integer(),
          unread_threads: integer(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
