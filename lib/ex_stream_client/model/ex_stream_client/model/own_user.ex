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
    :id,
    :role,
    :language,
    :custom,
    :created_at,
    :updated_at,
    :mutes,
    :push_preferences,
    :banned,
    :channel_mutes,
    :devices,
    :online,
    :total_unread_count,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :blocked_user_ids,
    :deactivated_at,
    :deleted_at,
    :invisible,
    :last_active,
    :last_engaged_at,
    :latest_hidden_channels,
    :privacy_settings,
    :teams,
    :teams_role
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          role: String.t(),
          language: String.t(),
          custom: map(),
          created_at: float(),
          updated_at: float(),
          mutes: [ExStreamClient.Model.UserMute.t()],
          push_preferences: ExStreamClient.Model.PushPreferences.t() | nil,
          banned: boolean(),
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()],
          devices: [ExStreamClient.Model.Device.t()],
          online: boolean(),
          total_unread_count: integer(),
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          blocked_user_ids: [String.t()] | nil,
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          invisible: boolean() | nil,
          last_active: float() | nil,
          last_engaged_at: float() | nil,
          latest_hidden_channels: [String.t()] | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettings.t() | nil,
          teams: [String.t()] | nil,
          teams_role: map() | nil
        }
end