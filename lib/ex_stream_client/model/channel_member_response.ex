defmodule ExStreamClient.Model.ChannelMemberResponse do
  @moduledoc "Schema representing a ChannelMemberResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :banned,
    :channel_role,
    :created_at,
    :custom,
    :notifications_muted,
    :shadow_banned,
    :updated_at
  ]
  defstruct [
    :archived_at,
    :ban_expires,
    :banned,
    :channel_role,
    :created_at,
    :custom,
    :deleted_at,
    :invite_accepted_at,
    :invite_rejected_at,
    :invited,
    :is_moderator,
    :notifications_muted,
    :pinned_at,
    :role,
    :shadow_banned,
    :status,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components archived_at: :datetime,
                     ban_expires: :datetime,
                     created_at: :datetime,
                     deleted_at: :datetime,
                     invite_accepted_at: :datetime,
                     invite_rejected_at: :datetime,
                     pinned_at: :datetime,
                     role: :enum,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          archived_at: (DateTime.t() | integer() | String.t()) | nil,
          ban_expires: (DateTime.t() | integer() | String.t()) | nil,
          banned: boolean(),
          channel_role: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          invite_accepted_at: (DateTime.t() | integer() | String.t()) | nil,
          invite_rejected_at: (DateTime.t() | integer() | String.t()) | nil,
          invited: boolean() | nil,
          is_moderator: boolean() | nil,
          notifications_muted: boolean(),
          pinned_at: (DateTime.t() | integer() | String.t()) | nil,
          role: (:owner | :admin | :moderator | :member) | nil,
          shadow_banned: boolean(),
          status: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t() | nil
        }
end
