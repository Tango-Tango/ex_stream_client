defmodule ExStreamClient.Model.OwnUser do
  @moduledoc "Schema representing a OwnUser"
  use ExStreamClient.Jason

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
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]
  defstruct [
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
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]

  @nested_components channel_mutes: ExStreamClient.Model.ChannelMute,
                     devices: ExStreamClient.Model.Device,
                     mutes: ExStreamClient.Model.UserMute,
                     privacy_settings: ExStreamClient.Model.PrivacySettings,
                     push_preferences: ExStreamClient.Model.PushPreferences
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned: boolean(),
          blocked_user_ids: [String.t()] | nil,
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()],
          created_at: float(),
          custom: map(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          devices: [ExStreamClient.Model.Device.t()],
          id: String.t(),
          invisible: boolean() | nil,
          language: String.t(),
          last_active: float() | nil,
          last_engaged_at: float() | nil,
          latest_hidden_channels: [String.t()] | nil,
          mutes: [ExStreamClient.Model.UserMute.t()],
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettings.t() | nil,
          push_preferences: ExStreamClient.Model.PushPreferences.t() | nil,
          role: String.t(),
          teams: [String.t()] | nil,
          teams_role: map() | nil,
          total_unread_count: integer(),
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          updated_at: float()
        }
end
