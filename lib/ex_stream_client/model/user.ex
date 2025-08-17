defmodule ExStreamClient.Model.User do
  @moduledoc "Schema representing a User"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:banned, :custom, :id, :online, :role, :teams_role]
  defstruct [
    :avg_response_time,
    :ban_expires,
    :banned,
    :channel_last_read_at,
    :channel_unread_count,
    :created_at,
    :custom,
    :deactivated_at,
    :deleted_at,
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
    :unread_thread_messages,
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
          avg_response_time: integer() | nil,
          ban_expires: (DateTime.t() | integer() | String.t()) | nil,
          banned: boolean(),
          channel_last_read_at: String.t() | nil,
          channel_unread_count: integer() | nil,
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          custom: %{optional(String.t()) => any()},
          deactivated_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
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
          unread_thread_messages: integer() | nil,
          updated_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
