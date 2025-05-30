defmodule ExStreamClient.Model.CreateChannelTypeRequest do
  @moduledoc "Schema representing a CreateChannelTypeRequest"
  use ExStreamClient.Jason
  @enforce_keys [:automod, :automod_behavior, :max_message_length, :name]
  defstruct [
    :automod,
    :automod_behavior,
    :blocklist,
    :blocklist_behavior,
    :blocklists,
    :commands,
    :connect_events,
    :custom_events,
    :grants,
    :mark_messages_pending,
    :max_message_length,
    :message_retention,
    :mutes,
    :name,
    :partition_size,
    :partition_ttl,
    :permissions,
    :polls,
    :push_notifications,
    :reactions,
    :read_events,
    :replies,
    :search,
    :skip_last_msg_update_for_system_msgs,
    :typing_events,
    :uploads,
    :url_enrichment
  ]

  @nested_components %{
    permissions: ExStreamClient.Model.PolicyRequest,
    automod: :atom,
    automod_behavior: :atom,
    blocklist_behavior: :atom,
    blocklists: ExStreamClient.Model.BlockListOptions,
    message_retention: :atom
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          automod: :AI | :simple | :disabled,
          automod_behavior: :block | :flag,
          blocklist: String.t() | nil,
          blocklist_behavior: (:shadow_block | :block | :flag) | nil,
          blocklists: [ExStreamClient.Model.BlockListOptions.t()] | nil,
          commands: [String.t()] | nil,
          connect_events: boolean() | nil,
          custom_events: boolean() | nil,
          grants: map() | nil,
          mark_messages_pending: boolean() | nil,
          max_message_length: integer(),
          message_retention: (:numeric | :infinite) | nil,
          mutes: boolean() | nil,
          name: String.t(),
          partition_size: integer() | nil,
          partition_ttl: String.t() | nil,
          permissions: [ExStreamClient.Model.PolicyRequest.t()] | nil,
          polls: boolean() | nil,
          push_notifications: boolean() | nil,
          reactions: boolean() | nil,
          read_events: boolean() | nil,
          replies: boolean() | nil,
          search: boolean() | nil,
          skip_last_msg_update_for_system_msgs: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil
        }
end
