defmodule ExStreamClient.Model.CreateChannelTypeRequest do
  @moduledoc "Schema representing a CreateChannelTypeRequest"
  use ExStreamClient.Jason
  @enforce_keys [:automod, :automod_behavior, :max_message_length, :name]
  defstruct [
    :name,
    :permissions,
    :search,
    :replies,
    :commands,
    :reactions,
    :automod,
    :automod_behavior,
    :max_message_length,
    :blocklist,
    :blocklist_behavior,
    :blocklists,
    :connect_events,
    :custom_events,
    :grants,
    :mark_messages_pending,
    :mutes,
    :partition_size,
    :partition_ttl,
    :polls,
    :push_notifications,
    :read_events,
    :skip_last_msg_update_for_system_msgs,
    :typing_events,
    :uploads,
    :url_enrichment,
    :message_retention
  ]

  @type t :: %__MODULE__{
          name: String.t(),
          permissions: [ExStreamClient.Model.PolicyRequest.t()] | nil,
          search: boolean() | nil,
          replies: boolean() | nil,
          commands: [String.t()] | nil,
          reactions: boolean() | nil,
          automod: :AI | :simple | :disabled,
          automod_behavior: :block | :flag,
          max_message_length: integer(),
          blocklist: String.t() | nil,
          blocklist_behavior: (:shadow_block | :block | :flag) | nil,
          blocklists: [ExStreamClient.Model.BlockListOptions.t()] | nil,
          connect_events: boolean() | nil,
          custom_events: boolean() | nil,
          grants: map() | nil,
          mark_messages_pending: boolean() | nil,
          mutes: boolean() | nil,
          partition_size: integer() | nil,
          partition_ttl: String.t() | nil,
          polls: boolean() | nil,
          push_notifications: boolean() | nil,
          read_events: boolean() | nil,
          skip_last_msg_update_for_system_msgs: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil,
          message_retention: (:numeric | :infinite) | nil
        }
end