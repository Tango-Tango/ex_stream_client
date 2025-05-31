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
    :commands,
    :connect_events,
    :custom_events,
    :grants,
    :mark_messages_pending,
    :max_message_length,
    :mutes,
    :partition_size,
    :partition_ttl,
    :permissions,
    :polls,
    :push_notifications,
    :quotes,
    :reactions,
    :read_events,
    :reminders,
    :replies,
    :search,
    :skip_last_msg_update_for_system_msgs,
    :typing_events,
    :uploads,
    :url_enrichment
  ]

  @nested_components automod: :atom,
                     automod_behavior: :atom,
                     automod_thresholds: ExStreamClient.Model.Thresholds,
                     blocklist_behavior: :atom,
                     blocklists: ExStreamClient.Model.BlockListOptions,
                     permissions: ExStreamClient.Model.PolicyRequest
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
          commands: [String.t()] | nil,
          connect_events: boolean() | nil,
          custom_events: boolean() | nil,
          grants: %{optional(String.t()) => [String.t()]} | nil,
          mark_messages_pending: boolean() | nil,
          max_message_length: integer(),
          mutes: boolean() | nil,
          partition_size: integer() | nil,
          partition_ttl: String.t() | nil,
          permissions: [ExStreamClient.Model.PolicyRequest.t()] | nil,
          polls: boolean() | nil,
          push_notifications: boolean() | nil,
          quotes: boolean() | nil,
          reactions: boolean() | nil,
          read_events: boolean() | nil,
          reminders: boolean() | nil,
          replies: boolean() | nil,
          search: boolean() | nil,
          skip_last_msg_update_for_system_msgs: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil
        }
end
