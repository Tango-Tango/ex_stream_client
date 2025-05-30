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
    :ban_expires,
    :banned,
    :blocked_user_ids,
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
    :name,
    :online,
    :privacy_settings,
    :push_notifications,
    :revoke_tokens_issued_before,
    :role,
    :shadow_banned,
    :teams,
    :teams_role,
    :updated_at
  ]

  @nested_components %{
    push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse,
    privacy_settings: ExStreamClient.Model.PrivacySettingsResponse,
    devices: ExStreamClient.Model.DeviceResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_expires: float() | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: float(),
          custom: map(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          devices: [ExStreamClient.Model.DeviceResponse.t()] | nil,
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean(),
          language: String.t(),
          last_active: float() | nil,
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse.t() | nil,
          revoke_tokens_issued_before: float() | nil,
          role: String.t(),
          shadow_banned: boolean(),
          teams: [String.t()],
          teams_role: map() | nil,
          updated_at: float()
        }
end
