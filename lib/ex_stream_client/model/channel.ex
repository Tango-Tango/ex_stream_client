defmodule ExStreamClient.Model.Channel do
  @moduledoc "Schema representing a Channel"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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
    :active_live_locations,
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

  @nested_components active_live_locations: ExStreamClient.Model.SharedLocation,
                     config: ExStreamClient.Model.ChannelConfig,
                     config_overrides: ExStreamClient.Model.ConfigOverrides,
                     created_at: :datetime,
                     created_by: ExStreamClient.Model.User,
                     deleted_at: :datetime,
                     invites: ExStreamClient.Model.ChannelMember,
                     last_message_at: :datetime,
                     members: ExStreamClient.Model.ChannelMember,
                     truncated_by: ExStreamClient.Model.User,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          active_live_locations: [ExStreamClient.Model.SharedLocation.t()] | nil,
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t(),
          cid: String.t(),
          config: ExStreamClient.Model.ChannelConfig.t() | nil,
          config_overrides: ExStreamClient.Model.ConfigOverrides.t() | nil,
          cooldown: integer() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.User.t() | nil,
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          disabled: boolean(),
          frozen: boolean(),
          id: String.t(),
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          last_campaigns: String.t() | nil,
          last_message_at: (DateTime.t() | integer() | String.t()) | nil,
          member_count: integer() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          team: String.t() | nil,
          truncated_by: ExStreamClient.Model.User.t() | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
