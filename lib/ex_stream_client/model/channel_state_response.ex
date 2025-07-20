defmodule ExStreamClient.Model.ChannelStateResponse do
  @moduledoc "Schema representing a ChannelStateResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :members, :messages, :pinned_messages, :threads]
  defstruct [
    :active_live_locations,
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

  @nested_components active_live_locations: ExStreamClient.Model.SharedLocationResponseData,
                     channel: ExStreamClient.Model.ChannelResponse,
                     draft: ExStreamClient.Model.DraftResponse,
                     hide_messages_before: :datetime,
                     members: ExStreamClient.Model.ChannelMember,
                     membership: ExStreamClient.Model.ChannelMember,
                     messages: ExStreamClient.Model.MessageResponse,
                     pending_messages: ExStreamClient.Model.PendingMessageResponse,
                     pinned_messages: ExStreamClient.Model.MessageResponse,
                     push_preferences: ExStreamClient.Model.ChannelPushPreferences,
                     read: ExStreamClient.Model.ReadStateResponse,
                     threads: ExStreamClient.Model.ThreadStateResponse,
                     watchers: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          active_live_locations: [ExStreamClient.Model.SharedLocationResponseData.t()] | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          draft: ExStreamClient.Model.DraftResponse.t() | nil,
          duration: String.t(),
          hidden: boolean() | nil,
          hide_messages_before: (DateTime.t() | integer() | String.t()) | nil,
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
