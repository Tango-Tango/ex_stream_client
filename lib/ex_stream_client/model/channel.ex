defmodule ExStreamClient.Model.Channel do
  @moduledoc "Schema representing a Channel"
  use ExStreamClient.Jason

  @enforce_keys [
    :auto_translation_language,
    :cid,
    :created_at,
    :custom,
    :disabled,
    :frozen,
    :id,
    :type,
    :updated_at
  ]
  defstruct [
    :auto_translation_enabled,
    :auto_translation_language,
    :cid,
    :config,
    :config_overrides,
    :cooldown,
    :created_at,
    :created_by,
    :custom,
    :deleted_at,
    :disabled,
    :frozen,
    :id,
    :invites,
    :last_campaigns,
    :last_message_at,
    :member_count,
    :members,
    :team,
    :truncated_by,
    :type,
    :updated_at
  ]

  @nested_components config: ExStreamClient.Model.ChannelConfig,
                     config_overrides: ExStreamClient.Model.ConfigOverrides,
                     created_by: ExStreamClient.Model.User,
                     invites: ExStreamClient.Model.ChannelMember,
                     members: ExStreamClient.Model.ChannelMember,
                     truncated_by: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t(),
          cid: String.t(),
          config: ExStreamClient.Model.ChannelConfig.t() | nil,
          config_overrides: ExStreamClient.Model.ConfigOverrides.t() | nil,
          cooldown: integer() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t() | nil,
          custom: map(),
          deleted_at: float() | nil,
          disabled: boolean(),
          frozen: boolean(),
          id: String.t(),
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          last_campaigns: String.t() | nil,
          last_message_at: float() | nil,
          member_count: integer() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          team: String.t() | nil,
          truncated_by: ExStreamClient.Model.User.t() | nil,
          type: String.t(),
          updated_at: float()
        }
end
