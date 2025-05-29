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
    :disabled,
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
    :deleted_at,
    :auto_translation_enabled,
    :member_count,
    :auto_translation_language,
    :config_overrides,
    :frozen,
    :invites,
    :cooldown,
    :last_message_at,
    :last_campaigns,
    :truncated_by
  ]

  @type t :: %__MODULE__{
          disabled: boolean(),
          id: String.t(),
          type: String.t(),
          config: ExStreamClient.Model.ChannelConfig.t() | nil,
          custom: map(),
          team: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t() | nil,
          cid: String.t(),
          updated_at: float(),
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          deleted_at: float() | nil,
          auto_translation_enabled: boolean() | nil,
          member_count: integer() | nil,
          auto_translation_language: String.t(),
          config_overrides: ExStreamClient.Model.ConfigOverrides.t() | nil,
          frozen: boolean(),
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          cooldown: integer() | nil,
          last_message_at: float() | nil,
          last_campaigns: String.t() | nil,
          truncated_by: ExStreamClient.Model.User.t() | nil
        }
end