defmodule ExStreamClient.Model.NotificationMarkUnreadEvent do
  @moduledoc "Schema representing a NotificationMarkUnreadEvent"
  use ExStreamClient.Jason

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
    :type,
    :user,
    :channel,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :last_read_message_id,
    :channel_member_count,
    :total_unread_count,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :first_unread_message_id,
    :last_read_at,
    :unread_messages,
    :thread_id
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          last_read_message_id: String.t() | nil,
          channel_member_count: integer(),
          total_unread_count: integer(),
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          first_unread_message_id: String.t(),
          last_read_at: float(),
          unread_messages: integer(),
          thread_id: String.t() | nil
        }
end