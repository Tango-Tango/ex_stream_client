defmodule ExStreamClient.Model.ChannelStateResponse do
  @moduledoc "Schema representing a ChannelStateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members, :messages, :pinned_messages, :threads]
  defstruct [
    :channel,
    :draft,
    :duration,
    :hidden,
    :hide_messages_before,
    :members,
    :membership,
    :messages,
    :pending_messages,
    :pinned_messages,
    :push_preferences,
    :read,
    :threads,
    :watcher_count,
    :watchers
  ]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          draft: ExStreamClient.Model.DraftResponse.t() | nil,
          duration: String.t(),
          hidden: boolean() | nil,
          hide_messages_before: float() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()],
          membership: ExStreamClient.Model.ChannelMember.t() | nil,
          messages: [ExStreamClient.Model.MessageResponse.t()],
          pending_messages: [ExStreamClient.Model.PendingMessageResponse.t()] | nil,
          pinned_messages: [ExStreamClient.Model.MessageResponse.t()],
          push_preferences: ExStreamClient.Model.ChannelPushPreferences.t() | nil,
          read: [ExStreamClient.Model.ReadStateResponse.t()] | nil,
          threads: [ExStreamClient.Model.ThreadStateResponse.t()],
          watcher_count: integer() | nil,
          watchers: [ExStreamClient.Model.UserResponse.t()] | nil
        }
end