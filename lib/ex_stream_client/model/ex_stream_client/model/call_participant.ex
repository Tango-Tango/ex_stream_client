defmodule ExStreamClient.Model.CallParticipant do
  @moduledoc "Schema representing a CallParticipant"
  use ExStreamClient.Jason
  @enforce_keys [:joined_at, :role, :user_session_id, :banned, :custom, :id, :online, :teams_role]
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
    :joined_at,
    :user_session_id,
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
          joined_at: float(),
          user_session_id: String.t(),
          ban_expires: float() | nil,
          revoke_tokens_issued_before: float() | nil
        }
end