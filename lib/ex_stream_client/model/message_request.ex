defmodule ExStreamClient.Model.MessageRequest do
  @moduledoc "Schema representing a MessageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :attachments,
    :custom,
    :html,
    :id,
    :mentioned_users,
    :mml,
    :parent_id,
    :pin_expires,
    :pinned,
    :pinned_at,
    :poll_id,
    :quoted_message_id,
    :restricted_visibility,
    :show_in_channel,
    :silent,
    :text,
    :type,
    :user,
    :user_id
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment,
                     type: :atom,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          custom: map() | nil,
          html: String.t() | nil,
          id: String.t() | nil,
          mentioned_users: [String.t()] | nil,
          mml: String.t() | nil,
          parent_id: String.t() | nil,
          pin_expires: float() | nil,
          pinned: boolean() | nil,
          pinned_at: String.t() | nil,
          poll_id: String.t() | nil,
          quoted_message_id: String.t() | nil,
          restricted_visibility: [String.t()] | nil,
          show_in_channel: boolean() | nil,
          silent: boolean() | nil,
          text: String.t() | nil,
          type: (:system | :regular | :"''") | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
