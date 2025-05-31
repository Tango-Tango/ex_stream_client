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

  @nested_components privacy_settings: ExStreamClient.Model.PrivacySettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: float(),
          custom: map(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean() | nil,
          language: String.t(),
          last_active: float() | nil,
          name: String.t() | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          revoke_tokens_issued_before: float() | nil,
          role: String.t(),
          teams: [String.t()],
          teams_role: map() | nil,
          updated_at: float()
        }
end
