defmodule ExStreamClient.Model.ChannelMember do
  @moduledoc "Schema representing a ChannelMember"
  use ExStreamClient.Jason

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
    :status,
    :user,
    :role,
    :custom,
    :created_at,
    :user_id,
    :updated_at,
    :banned,
    :deleted_at,
    :ban_expires,
    :pinned_at,
    :shadow_banned,
    :channel_role,
    :notifications_muted,
    :archived_at,
    :invite_accepted_at,
    :invite_rejected_at,
    :invited,
    :is_moderator
  ]

  @type t :: %__MODULE__{
          status: String.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          role: (:owner | :admin | :moderator | :member) | nil,
          custom: map(),
          created_at: float(),
          user_id: String.t() | nil,
          updated_at: float(),
          banned: boolean(),
          deleted_at: float() | nil,
          ban_expires: float() | nil,
          pinned_at: float() | nil,
          shadow_banned: boolean(),
          channel_role: String.t(),
          notifications_muted: boolean(),
          archived_at: float() | nil,
          invite_accepted_at: float() | nil,
          invite_rejected_at: float() | nil,
          invited: boolean() | nil,
          is_moderator: boolean() | nil
        }
end