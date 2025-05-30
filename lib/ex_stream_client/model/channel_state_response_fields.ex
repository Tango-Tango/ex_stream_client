defmodule ExStreamClient.Model.ChannelStateResponseFields do
  @moduledoc "Schema representing a ChannelStateResponseFields"
  use ExStreamClient.Jason
  @enforce_keys [:members, :messages, :pinned_messages, :threads]
  defstruct [
    :channel,
    :draft,
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

  @nested_components %{
    messages: ExStreamClient.Model.MessageResponse,
    threads: ExStreamClient.Model.ThreadStateResponse,
    read: ExStreamClient.Model.ReadStateResponse,
    membership: ExStreamClient.Model.ChannelMember,
    channel: ExStreamClient.Model.ChannelResponse,
    members: ExStreamClient.Model.ChannelMember,
    watchers: ExStreamClient.Model.UserResponse,
    pinned_messages: ExStreamClient.Model.MessageResponse,
    draft: ExStreamClient.Model.DraftResponse,
    pending_messages: ExStreamClient.Model.PendingMessageResponse,
    push_preferences: ExStreamClient.Model.ChannelPushPreferences
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          draft: ExStreamClient.Model.DraftResponse.t() | nil,
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
