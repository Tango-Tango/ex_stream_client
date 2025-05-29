defmodule ExStreamClient.Model.ChannelResponse do
  @moduledoc "Schema representing a ChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:cid, :created_at, :custom, :disabled, :frozen, :id, :type, :updated_at]
  defstruct [
    :blocked,
    :disabled,
    :hidden,
    :id,
    :type,
    :config,
    :custom,
    :team,
    :created_at,
    :created_by,
    :cid,
    :updated_at,
    :members,
    :hide_messages_before,
    :deleted_at,
    :auto_translation_enabled,
    :member_count,
    :auto_translation_language,
    :frozen,
    :cooldown,
    :last_message_at,
    :truncated_by,
    :truncated_at,
    :mute_expires_at,
    :muted,
    :own_capabilities
  ]

  @type t :: %__MODULE__{
          blocked: boolean() | nil,
          disabled: boolean(),
          hidden: boolean() | nil,
          id: String.t(),
          type: String.t(),
          config: ExStreamClient.Model.ChannelConfigWithInfo.t() | nil,
          custom: map(),
          team: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          cid: String.t(),
          updated_at: float(),
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          hide_messages_before: float() | nil,
          deleted_at: float() | nil,
          auto_translation_enabled: boolean() | nil,
          member_count: integer() | nil,
          auto_translation_language: String.t() | nil,
          frozen: boolean(),
          cooldown: integer() | nil,
          last_message_at: float() | nil,
          truncated_by: ExStreamClient.Model.UserResponse.t() | nil,
          truncated_at: float() | nil,
          mute_expires_at: float() | nil,
          muted: boolean() | nil,
          own_capabilities: [ExStreamClient.Model.ChannelOwnCapability.t()] | nil
        }
end