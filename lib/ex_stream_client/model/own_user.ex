defmodule ExStreamClient.Model.OwnUser do
  @moduledoc "Schema representing a OwnUser"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :banned,
    :channel_mutes,
    :created_at,
    :custom,
    :devices,
    :id,
    :language,
    :mutes,
    :online,
    :role,
    :total_unread_count,
    :total_unread_count_by_team,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]
  defstruct [
    :avg_response_time,
    :banned,
    :blocked_user_ids,
    :channel_mutes,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
    :devices,
    :id,
    :invisible,
    :language,
    :last_active,
    :last_engaged_at,
    :latest_hidden_channels,
    :mutes,
    :online,
    :privacy_settings,
    :push_preferences,
    :role,
    :teams,
    :teams_role,
    :total_unread_count,
    :total_unread_count_by_team,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]

  @nested_components channel_mutes: ExStreamClient.Model.ChannelMute,
                     created_at: :datetime,
                     deactivated_at: :datetime,
                     deleted_at: :datetime,
                     devices: ExStreamClient.Model.Device,
                     last_active: :datetime,
                     last_engaged_at: :datetime,
                     mutes: ExStreamClient.Model.UserMute,
                     privacy_settings: ExStreamClient.Model.PrivacySettings,
                     push_preferences: ExStreamClient.Model.PushPreferences,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          avg_response_time: integer() | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()] | nil,
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()],
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          devices: [ExStreamClient.Model.Device.t()],
          id: String.t(),
          invisible: boolean() | nil,
          language: String.t(),
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          last_engaged_at: (DateTime.t() | integer() | String.t()) | nil,
          latest_hidden_channels: [String.t()] | nil,
          mutes: [ExStreamClient.Model.UserMute.t()],
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettings.t() | nil,
          push_preferences: ExStreamClient.Model.PushPreferences.t() | nil,
          role: String.t(),
          teams: [String.t()] | nil,
          teams_role: %{optional(String.t()) => String.t()} | nil,
          total_unread_count: integer(),
          total_unread_count_by_team: %{optional(String.t()) => integer()},
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
