defmodule ExStreamClient.Model.MessageNewEvent do
  @moduledoc "Schema representing a MessageNewEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type, :watcher_count]
  defstruct [
    :channel,
    :channel_custom,
    :channel_id,
    :channel_last_message_at,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :members,
    :message,
    :message_id,
    :team,
    :thread_participants,
    :type,
    :user,
    :watcher_count
  ]

  @nested_components channel: ExStreamClient.Model.Channel,
                     created_at: :datetime,
                     members: ExStreamClient.Model.ChannelMember,
                     message: ExStreamClient.Model.Message,
                     thread_participants: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t(),
          channel_last_message_at: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_type: String.t(),
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          message_id: String.t() | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          watcher_count: integer()
        }
end
