defmodule ExStreamClient.Model.NotificationMarkUnreadEvent do
  @moduledoc "Schema representing a NotificationMarkUnreadEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [
    :channel,
    :channel_custom,
    :channel_id,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :custom,
    :first_unread_message_id,
    :grouped_unread_channels,
    :last_read_at,
    :last_read_message_id,
    :received_at,
    :team,
    :thread_id,
    :total_unread_count,
    :type,
    :unread_channels,
    :unread_count,
    :unread_messages,
    :unread_thread_messages,
    :unread_threads,
    :user
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     last_read_at: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_message_count: integer() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          first_unread_message_id: String.t() | nil,
          grouped_unread_channels: %{optional(String.t()) => integer()} | nil,
          last_read_at: (DateTime.t() | integer() | String.t()) | nil,
          last_read_message_id: String.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          team: String.t() | nil,
          thread_id: String.t() | nil,
          total_unread_count: integer() | nil,
          type: String.t(),
          unread_channels: integer() | nil,
          unread_count: integer() | nil,
          unread_messages: integer() | nil,
          unread_thread_messages: integer() | nil,
          unread_threads: integer() | nil,
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
