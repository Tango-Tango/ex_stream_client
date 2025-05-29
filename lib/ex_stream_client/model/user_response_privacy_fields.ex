defmodule ExStreamClient.Model.UserResponsePrivacyFields do
  @moduledoc "Schema representing a UserResponsePrivacyFields"
  use ExStreamClient.Jason

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
    :id,
    :name,
    :image,
    :role,
    :language,
    :custom,
    :created_at,
    :updated_at,
    :banned,
    :online,
    :blocked_user_ids,
    :deactivated_at,
    :deleted_at,
    :invisible,
    :last_active,
    :privacy_settings,
    :teams,
    :teams_role,
    :revoke_tokens_issued_before
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
          banned: boolean(),
          online: boolean(),
          blocked_user_ids: [String.t()],
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          invisible: boolean() | nil,
          last_active: float() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          teams: [String.t()],
          teams_role: map() | nil,
          revoke_tokens_issued_before: float() | nil
        }
end