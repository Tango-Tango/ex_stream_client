defmodule ExStreamClient.Model.FullUserResponse do
  @moduledoc "Schema representing a FullUserResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :banned,
    :blocked_user_ids,
    :channel_mutes,
    :created_at,
    :custom,
    :devices,
    :id,
    :invisible,
    :language,
    :mutes,
    :online,
    :role,
    :shadow_banned,
    :teams,
    :total_unread_count,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]
  defstruct [
    :ban_expires,
    :banned,
    :blocked_user_ids,
    :channel_mutes,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
    :devices,
    :id,
    :image,
    :invisible,
    :language,
    :last_active,
    :latest_hidden_channels,
    :mutes,
    :name,
    :online,
    :privacy_settings,
    :revoke_tokens_issued_before,
    :role,
    :shadow_banned,
    :teams,
    :teams_role,
    :total_unread_count,
    :unread_channels,
    :unread_count,
    :unread_threads,
    :updated_at
  ]

  @nested_components channel_mutes: ExStreamClient.Model.ChannelMute,
                     devices: ExStreamClient.Model.DeviceResponse,
                     mutes: ExStreamClient.Model.UserMuteResponse,
                     privacy_settings: ExStreamClient.Model.PrivacySettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_expires: float() | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()],
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()],
          created_at: float(),
          custom: map(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          devices: [ExStreamClient.Model.DeviceResponse.t()],
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean(),
          language: String.t(),
          last_active: float() | nil,
          latest_hidden_channels: [String.t()] | nil,
          mutes: [ExStreamClient.Model.UserMuteResponse.t()],
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          revoke_tokens_issued_before: float() | nil,
          role: String.t(),
          shadow_banned: boolean(),
          teams: [String.t()],
          teams_role: map() | nil,
          total_unread_count: integer(),
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          updated_at: float()
        }
end
