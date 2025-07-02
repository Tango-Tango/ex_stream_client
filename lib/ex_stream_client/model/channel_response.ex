defmodule ExStreamClient.Model.ChannelResponse do
  @moduledoc "Schema representing a ChannelResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components config: ExStreamClient.Model.ChannelConfigWithInfo,
                     created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponse,
                     deleted_at: :datetime,
                     hide_messages_before: :datetime,
                     last_message_at: :datetime,
                     members: ExStreamClient.Model.ChannelMember,
                     mute_expires_at: :datetime,
                     own_capabilities: ExStreamClient.Model.ChannelOwnCapability,
                     truncated_at: :datetime,
                     truncated_by: ExStreamClient.Model.UserResponse,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          blocked: boolean() | nil,
          cid: String.t(),
          config: ExStreamClient.Model.ChannelConfigWithInfo.t() | nil,
          cooldown: integer() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          disabled: boolean(),
          frozen: boolean(),
          hidden: boolean() | nil,
          hide_messages_before: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t(),
          last_message_at: (DateTime.t() | integer() | String.t()) | nil,
          member_count: integer() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          mute_expires_at: (DateTime.t() | integer() | String.t()) | nil,
          muted: boolean() | nil,
          own_capabilities: [ExStreamClient.Model.ChannelOwnCapability.t()] | nil,
          team: String.t() | nil,
          truncated_at: (DateTime.t() | integer() | String.t()) | nil,
          truncated_by: ExStreamClient.Model.UserResponse.t() | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
