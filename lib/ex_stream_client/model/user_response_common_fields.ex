defmodule ExStreamClient.Model.UserResponseCommonFields do
  @moduledoc "Schema representing a UserResponseCommonFields"
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
    :language,
    :last_active,
    :name,
    :online,
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
                     revoke_tokens_issued_before: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned: boolean(),
          blocked_user_ids: [String.t()],
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t(),
          image: String.t() | nil,
          language: String.t(),
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          name: String.t() | nil,
          online: boolean(),
          revoke_tokens_issued_before: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          teams: [String.t()],
          teams_role: %{optional(String.t()) => String.t()} | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
