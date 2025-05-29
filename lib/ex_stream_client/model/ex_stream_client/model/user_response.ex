defmodule ExStreamClient.Model.UserResponse do
  @moduledoc "Schema representing a UserResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :banned,
    :blocked_user_ids,
    :created_at,
    :custom,
    :id,
    :invisible,
    :language,
    :online,
    :role,
    :shadow_banned,
    :teams,
    :updated_at
  ]
  defstruct [
    :id,
    :name,
    :image,
    :role,
    :language,
    :custom,
    :created_at,
    :updated_at,
    :push_notifications,
    :banned,
    :devices,
    :online,
    :blocked_user_ids,
    :deactivated_at,
    :deleted_at,
    :invisible,
    :last_active,
    :privacy_settings,
    :teams,
    :teams_role,
    :ban_expires,
    :revoke_tokens_issued_before,
    :shadow_banned
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t() | nil,
          image: String.t() | nil,
          role: String.t(),
          language: String.t(),
          custom: map(),
          created_at: float(),
          updated_at: float(),
          push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse.t() | nil,
          banned: boolean(),
          devices: [ExStreamClient.Model.DeviceResponse.t()] | nil,
          online: boolean(),
          blocked_user_ids: [String.t()],
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          invisible: boolean(),
          last_active: float() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          teams: [String.t()],
          teams_role: map() | nil,
          ban_expires: float() | nil,
          revoke_tokens_issued_before: float() | nil,
          shadow_banned: boolean()
        }
end