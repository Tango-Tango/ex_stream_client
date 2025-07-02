defmodule ExStreamClient.Model.EntityCreator do
  @moduledoc "Schema representing a EntityCreator"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :ban_count,
    :banned,
    :custom,
    :deleted_content_count,
    :id,
    :online,
    :role,
    :teams_role
  ]
  defstruct [
    :ban_count,
    :ban_expires,
    :banned,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
    :deleted_content_count,
    :id,
    :invisible,
    :language,
    :last_active,
    :last_engaged_at,
    :online,
    :privacy_settings,
    :revoke_tokens_issued_before,
    :role,
    :teams,
    :teams_role,
    :updated_at
  ]

  @nested_components ban_expires: :datetime,
                     created_at: :datetime,
                     deactivated_at: :datetime,
                     deleted_at: :datetime,
                     last_active: :datetime,
                     last_engaged_at: :datetime,
                     privacy_settings: ExStreamClient.Model.PrivacySettings,
                     revoke_tokens_issued_before: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_count: integer(),
          ban_expires: (DateTime.t() | integer() | String.t()) | nil,
          banned: boolean(),
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_content_count: integer(),
          id: String.t(),
          invisible: boolean() | nil,
          language: String.t() | nil,
          last_active: (DateTime.t() | integer() | String.t()) | nil,
          last_engaged_at: (DateTime.t() | integer() | String.t()) | nil,
          online: boolean(),
          privacy_settings: ExStreamClient.Model.PrivacySettings.t() | nil,
          revoke_tokens_issued_before: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          teams: [String.t()] | nil,
          teams_role: %{optional(String.t()) => String.t()},
          updated_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
