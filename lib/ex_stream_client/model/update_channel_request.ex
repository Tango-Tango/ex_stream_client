defmodule ExStreamClient.Model.UpdateChannelRequest do
  @moduledoc "Schema representing a UpdateChannelRequest"
  use ExStreamClient.Jason

  defstruct [
    :data,
    :message,
    :user,
    :user_id,
    :skip_push,
    :invites,
    :accept_invite,
    :add_members,
    :add_moderators,
    :assign_roles,
    :cooldown,
    :demote_moderators,
    :hide_history,
    :reject_invite,
    :remove_members
  ]

  @type t :: %__MODULE__{
          data: ExStreamClient.Model.ChannelInput.t() | nil,
          message: ExStreamClient.Model.MessageRequest.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          skip_push: boolean() | nil,
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          accept_invite: boolean() | nil,
          add_members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          add_moderators: [String.t()] | nil,
          assign_roles: [ExStreamClient.Model.ChannelMember.t()] | nil,
          cooldown: integer() | nil,
          demote_moderators: [String.t()] | nil,
          hide_history: boolean() | nil,
          reject_invite: boolean() | nil,
          remove_members: [String.t()] | nil
        }
end