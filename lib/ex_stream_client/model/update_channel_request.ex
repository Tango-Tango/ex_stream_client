defmodule ExStreamClient.Model.UpdateChannelRequest do
  @moduledoc "Schema representing a UpdateChannelRequest"
  use ExStreamClient.Jason

  defstruct [
    :accept_invite,
    :add_members,
    :add_moderators,
    :assign_roles,
    :cooldown,
    :data,
    :demote_moderators,
    :hide_history,
    :invites,
    :message,
    :reject_invite,
    :remove_members,
    :skip_push,
    :user,
    :user_id
  ]

  @nested_components %{
    data: ExStreamClient.Model.ChannelInput,
    message: ExStreamClient.Model.MessageRequest,
    user: ExStreamClient.Model.UserRequest,
    invites: ExStreamClient.Model.ChannelMember,
    add_members: ExStreamClient.Model.ChannelMember,
    assign_roles: ExStreamClient.Model.ChannelMember
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          accept_invite: boolean() | nil,
          add_members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          add_moderators: [String.t()] | nil,
          assign_roles: [ExStreamClient.Model.ChannelMember.t()] | nil,
          cooldown: integer() | nil,
          data: ExStreamClient.Model.ChannelInput.t() | nil,
          demote_moderators: [String.t()] | nil,
          hide_history: boolean() | nil,
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          message: ExStreamClient.Model.MessageRequest.t() | nil,
          reject_invite: boolean() | nil,
          remove_members: [String.t()] | nil,
          skip_push: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
