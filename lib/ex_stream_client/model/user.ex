defmodule ExStreamClient.Model.User do
  @moduledoc "Schema representing a User"
  use ExStreamClient.Jason
  @enforce_keys [:banned, :custom, :id, :online, :role, :teams_role]
  defstruct [
    :id,
    :role,
    :language,
    :custom,
    :created_at,
    :updated_at,
    :banned,
    :online,
    :deactivated_at,
    :deleted_at,
    :invisible,
    :last_active,
    :last_engaged_at,
    :privacy_settings,
    :teams,
    :teams_role,
    :ban_expires,
    :revoke_tokens_issued_before
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          role: String.t(),
          language: String.t() | nil,
          custom: map(),
          created_at: float() | nil,
          updated_at: float() | nil,
          banned: boolean(),
          online: boolean(),
          deactivated_at: float() | nil,
          deleted_at: float() | nil,
          invisible: boolean() | nil,
          last_active: float() | nil,
          last_engaged_at: float() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettings.t() | nil,
          teams: [String.t()] | nil,
          teams_role: map(),
          ban_expires: float() | nil,
          revoke_tokens_issued_before: float() | nil
        }
end