defmodule ExStreamClient.Model.UserResponsePrivacyFields do
  @moduledoc "Schema representing a UserResponsePrivacyFields"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :banned,
    :blocked_user_ids,
    :created_at,
    :custom,
    :id,
    :language,
    :online,
    :role,
    :teams,
    :updated_at
  ]
  defstruct [
    :avg_response_time,
    :banned,
    :blocked_user_ids,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
    :id,
    :image,
    :invisible,
    :language,
    :last_active,
    :name,
    :online,
    :privacy_settings,
    :revoke_tokens_issued_before,
    :role,
    :teams,
    :teams_role,
    :updated_at
  ]

  @nested_components created_at: :datetime,
                     deactivated_at: :datetime,
                     deleted_at: :datetime,
                     last_active: :datetime,
                     privacy_settings: ExStreamClient.Model.PrivacySettingsResponse,
                     revoke_tokens_issued_before: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          avg_response_time: integer() | nil,
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean() | nil,
          language: String.t(),
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          revoke_tokens_issued_before: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          teams: [String.t()],
          teams_role: %{optional(String.t()) => String.t()} | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
