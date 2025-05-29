defmodule ExStreamClient.Model.ChannelStateResponse do
  @moduledoc "Schema representing a ChannelStateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members, :messages, :pinned_messages, :threads]
  defstruct [
    :hidden,
    :messages,
    :threads,
    :read,
    :membership,
    :channel,
    :duration,
    :members,
    :pinned_messages,
    :draft,
    :hide_messages_before,
    :pending_messages,
    :push_preferences,
    :watcher_count,
    :watchers
  ]

  @type t :: %__MODULE__{
          hidden: boolean() | nil,
          messages: [ExStreamClient.Model.MessageResponse.t()],
          threads: [ExStreamClient.Model.ThreadStateResponse.t()],
          read: [ExStreamClient.Model.ReadStateResponse.t()] | nil,
          membership: ExStreamClient.Model.ChannelMember.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMember.t()],
          pinned_messages: [ExStreamClient.Model.MessageResponse.t()],
          draft: ExStreamClient.Model.DraftResponse.t() | nil,
          hide_messages_before: float() | nil,
          pending_messages: [ExStreamClient.Model.PendingMessageResponse.t()] | nil,
          push_preferences: ExStreamClient.Model.ChannelPushPreferences.t() | nil,
          watcher_count: integer() | nil,
          watchers: [ExStreamClient.Model.UserResponse.t()] | nil
        }
end