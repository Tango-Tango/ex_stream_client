defmodule ExStreamClient.Model.MessageNewEvent do
  @moduledoc "Schema representing a MessageNewEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :message, :message_id, :type, :watcher_count]
  defstruct [
    :channel,
    :channel_custom,
    :channel_id,
    :channel_last_message_at,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :custom,
    :grouped_unread_channels,
    :members,
    :message,
    :message_id,
    :parent_author,
    :received_at,
    :team,
    :thread_participants,
    :total_unread_count,
    :type,
    :unread_channels,
    :unread_count,
    :user,
    :watcher_count
  ]

  @nested_components channel: ExStreamClient.Model.Channel,
                     created_at: :datetime,
                     members: ExStreamClient.Model.ChannelMember,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     thread_participants: ExStreamClient.Model.UserResponseCommonFields,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t() | nil,
          channel_last_message_at: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_message_count: integer() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          grouped_unread_channels: %{optional(String.t()) => integer()} | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          message: ExStreamClient.Model.MessageResponse.t(),
          message_id: String.t() | nil,
          parent_author: String.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.UserResponseCommonFields.t()] | nil,
          total_unread_count: integer() | nil,
          type: String.t(),
          unread_channels: integer() | nil,
          unread_count: integer() | nil,
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          watcher_count: integer()
        }
end
