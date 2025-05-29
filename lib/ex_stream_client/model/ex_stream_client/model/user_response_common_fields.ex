defmodule ExStreamClient.Model.UserResponseCommonFields do
  @moduledoc "Schema representing a UserResponseCommonFields"
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
    :last_active,
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
          last_active: float() | nil,
          teams: [String.t()],
          teams_role: map() | nil,
          revoke_tokens_issued_before: float() | nil
        }
end