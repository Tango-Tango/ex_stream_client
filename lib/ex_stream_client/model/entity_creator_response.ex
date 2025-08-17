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
    :avg_response_time,
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

  @nested_components ban_expires: :datetime,
                     created_at: :datetime,
                     deactivated_at: :datetime,
                     deleted_at: :datetime,
                     devices: ExStreamClient.Model.DeviceResponse,
                     last_active: :datetime,
                     privacy_settings: ExStreamClient.Model.PrivacySettingsResponse,
                     push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse,
                     revoke_tokens_issued_before: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          avg_response_time: integer() | nil,
          ban_count: integer(),
          ban_expires: (DateTime.t() | integer() | String.t()) | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_content_count: integer(),
          devices: [ExStreamClient.Model.DeviceResponse.t()] | nil,
          flagged_count: integer(),
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean(),
          language: String.t(),
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          push_notifications: ExStreamClient.Model.PushNotificationSettingsResponse.t() | nil,
          revoke_tokens_issued_before: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          shadow_banned: boolean(),
          teams: [String.t()],
          teams_role: %{optional(String.t()) => String.t()} | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
