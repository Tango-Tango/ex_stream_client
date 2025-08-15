defmodule ExStreamClient.Model.OwnUserResponse do
  @moduledoc "Schema representing a OwnUserResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :banned,
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
    :teams,
    :total_unread_count,
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
    :image,
    :invisible,
    :language,
    :last_active,
    :latest_hidden_channels,
    :mutes,
    :name,
    :online,
    :privacy_settings,
    :push_preferences,
    :revoke_tokens_issued_before,
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
                     devices: ExStreamClient.Model.DeviceResponse,
                     last_active: :datetime,
                     mutes: ExStreamClient.Model.UserMuteResponse,
                     privacy_settings: ExStreamClient.Model.PrivacySettingsResponse,
                     push_preferences: ExStreamClient.Model.PushPreferences,
                     revoke_tokens_issued_before: :datetime,
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
          devices: [ExStreamClient.Model.DeviceResponse.t()],
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean(),
          language: String.t(),
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          latest_hidden_channels: [String.t()] | nil,
          mutes: [ExStreamClient.Model.UserMuteResponse.t()],
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          push_preferences: ExStreamClient.Model.PushPreferences.t() | nil,
          revoke_tokens_issued_before: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          teams: [String.t()],
          teams_role: %{optional(String.t()) => String.t()} | nil,
          total_unread_count: integer(),
          total_unread_count_by_team: %{optional(String.t()) => integer()} | nil,
          unread_channels: integer(),
          unread_count: integer(),
          unread_threads: integer(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
