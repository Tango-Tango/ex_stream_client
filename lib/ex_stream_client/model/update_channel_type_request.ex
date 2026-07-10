defmodule ExStreamClient.Model.UpdateChannelTypeRequest do
  @moduledoc "Schema representing a UpdateChannelTypeRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:automod, :automod_behavior, :max_message_length]
  defstruct [
    :allowed_flag_reasons,
    :automod,
    :automod_behavior,
    :automod_thresholds,
    :blocklist,
    :blocklist_behavior,
    :blocklists,
    :chat_preferences,
    :commands,
    :connect_events,
    :count_messages,
    :custom_events,
    :delivery_events,
    :grants,
    :mark_messages_pending,
    :max_message_length,
    :mutes,
    :partition_size,
    :partition_ttl,
    :permissions,
    :polls,
    :push_level,
    :push_notifications,
    :quotes,
    :reactions,
    :read_events,
    :reminders,
    :replies,
    :search,
    :shared_locations,
    :skip_last_msg_update_for_system_msgs,
    :typing_events,
    :uploads,
    :url_enrichment,
    :user_message_reminders
  ]

  @nested_components automod: :enum,
                     automod_behavior: :enum,
                     automod_thresholds: ExStreamClient.Model.Thresholds,
                     blocklist_behavior: :enum,
                     blocklists: ExStreamClient.Model.BlockListOptions,
                     chat_preferences: ExStreamClient.Model.ChatPreferences,
                     permissions: ExStreamClient.Model.PolicyRequest,
                     push_level: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allowed_flag_reasons: [String.t()] | nil,
          automod: :AI | :simple | :disabled,
          automod_behavior: :shadow_block | :block | :flag,
          automod_thresholds: ExStreamClient.Model.Thresholds.t() | nil,
          blocklist: String.t() | nil,
          blocklist_behavior: (:shadow_block | :block | :flag) | nil,
          blocklists: [ExStreamClient.Model.BlockListOptions.t()] | nil,
          chat_preferences: ExStreamClient.Model.ChatPreferences.t() | nil,
          commands: [String.t()] | nil,
          connect_events: boolean() | nil,
          count_messages: boolean() | nil,
          custom_events: boolean() | nil,
          delivery_events: boolean() | nil,
          grants: %{optional(String.t()) => [String.t()]} | nil,
          mark_messages_pending: boolean() | nil,
          max_message_length: integer(),
          mutes: boolean() | nil,
          partition_size: integer() | nil,
          partition_ttl: String.t() | nil,
          permissions: [ExStreamClient.Model.PolicyRequest.t()] | nil,
          polls: boolean() | nil,
          push_level: (:none | :direct_mentions | :mentions | :all_mentions | :all) | nil,
          push_notifications: boolean() | nil,
          quotes: boolean() | nil,
          reactions: boolean() | nil,
          read_events: boolean() | nil,
          reminders: boolean() | nil,
          replies: boolean() | nil,
          search: boolean() | nil,
          shared_locations: boolean() | nil,
          skip_last_msg_update_for_system_msgs: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil,
          user_message_reminders: boolean() | nil
        }
end
