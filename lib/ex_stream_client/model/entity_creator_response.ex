defmodule ExStreamClient.Model.EntityCreatorResponse do
  @moduledoc "Schema representing a EntityCreatorResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :ban_count,
    :banned,
    :blocked_user_ids,
    :created_at,
    :custom,
    :deleted_content_count,
    :flagged_count,
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
    :ban_count,
    :ban_expires,
    :banned,
    :blocked_user_ids,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
    :deleted_content_count,
    :devices,
    :flagged_count,
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

  @nested_components devices: ExStreamClient.Model.DeviceResponse,
                     privacy_settings: ExStreamClient.Model.PrivacySettingsResponse,
                     push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_count: integer(),
          ban_expires: float() | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: float(),
          custom: map(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          deleted_content_count: integer(),
          devices: [ExStreamClient.Model.DeviceResponse.t()] | nil,
          flagged_count: integer(),
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
