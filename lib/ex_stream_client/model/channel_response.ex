defmodule ExStreamClient.Model.ChannelResponse do
  @moduledoc "Schema representing a ChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:cid, :created_at, :custom, :disabled, :frozen, :id, :type, :updated_at]
  defstruct [
    :auto_translation_enabled,
    :auto_translation_language,
    :blocked,
    :cid,
    :config,
    :cooldown,
    :created_at,
    :created_by,
    :custom,
    :deleted_at,
    :disabled,
    :frozen,
    :hidden,
    :hide_messages_before,
    :id,
    :last_message_at,
    :member_count,
    :members,
    :mute_expires_at,
    :muted,
    :own_capabilities,
    :team,
    :truncated_at,
    :truncated_by,
    :type,
    :updated_at
  ]

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          blocked: boolean() | nil,
          cid: String.t(),
          config: ExStreamClient.Model.ChannelConfigWithInfo.t() | nil,
          cooldown: integer() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          deleted_at: float() | nil,
          disabled: boolean(),
          frozen: boolean(),
          hidden: boolean() | nil,
          hide_messages_before: float() | nil,
          id: String.t(),
          last_message_at: float() | nil,
          member_count: integer() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          mute_expires_at: float() | nil,
          muted: boolean() | nil,
          own_capabilities: [ExStreamClient.Model.ChannelOwnCapability.t()] | nil,
          team: String.t() | nil,
          truncated_at: float() | nil,
          truncated_by: ExStreamClient.Model.UserResponse.t() | nil,
          type: String.t(),
          updated_at: float()
        }
end