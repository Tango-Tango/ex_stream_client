defmodule ExStreamClient.Model.UpdateChannelRequest do
  @moduledoc "Schema representing a UpdateChannelRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :accept_invite,
    :add_filter_tags,
    :add_members,
    :add_moderators,
    :assign_roles,
    :cooldown,
    :data,
    :demote_moderators,
    :hide_history,
    :hide_history_before,
    :invites,
    :message,
    :reject_invite,
    :remove_filter_tags,
    :remove_members,
    :skip_push,
    :user,
    :user_id
  ]

  @nested_components add_members: ExStreamClient.Model.ChannelMemberRequest,
                     assign_roles: ExStreamClient.Model.ChannelMemberRequest,
                     data: ExStreamClient.Model.ChannelInputRequest,
                     hide_history_before: :datetime,
                     invites: ExStreamClient.Model.ChannelMemberRequest,
                     message: ExStreamClient.Model.MessageRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          accept_invite: boolean() | nil,
          add_filter_tags: [String.t()] | nil,
          add_members: [ExStreamClient.Model.ChannelMemberRequest.t()] | nil,
          add_moderators: [String.t()] | nil,
          assign_roles: [ExStreamClient.Model.ChannelMemberRequest.t()] | nil,
          cooldown: integer() | nil,
          data: ExStreamClient.Model.ChannelInputRequest.t() | nil,
          demote_moderators: [String.t()] | nil,
          hide_history: boolean() | nil,
          hide_history_before: (DateTime.t() | integer() | String.t()) | nil,
          invites: [ExStreamClient.Model.ChannelMemberRequest.t()] | nil,
          message: ExStreamClient.Model.MessageRequest.t() | nil,
          reject_invite: boolean() | nil,
          remove_filter_tags: [String.t()] | nil,
          remove_members: [String.t()] | nil,
          skip_push: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
