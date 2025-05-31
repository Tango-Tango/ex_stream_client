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

  @nested_components role: :atom, user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          archived_at: float() | nil,
          ban_expires: float() | nil,
          banned: boolean(),
          channel_role: String.t(),
          created_at: float(),
          custom: %{optional(String.t()) => any()},
          deleted_at: float() | nil,
          invite_accepted_at: float() | nil,
          invite_rejected_at: float() | nil,
          invited: boolean() | nil,
          is_moderator: boolean() | nil,
          notifications_muted: boolean(),
          pinned_at: float() | nil,
          role: (:owner | :admin | :moderator | :member) | nil,
          shadow_banned: boolean(),
          status: String.t() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t() | nil
        }
end
