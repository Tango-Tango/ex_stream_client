defmodule ExStreamClient.Model.MessageRequest do
  @moduledoc "Schema representing a MessageRequest"
  use ExStreamClient.Jason

  defstruct [
    :id,
    :silent,
    :type,
    :user,
    :text,
    :custom,
    :attachments,
    :html,
    :mml,
    :quoted_message_id,
    :user_id,
    :restricted_visibility,
    :pinned,
    :mentioned_users,
    :show_in_channel,
    :parent_id,
    :pin_expires,
    :pinned_at,
    :poll_id
  ]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          silent: boolean() | nil,
          type: (:system | :regular | :"''") | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          text: String.t() | nil,
          custom: map() | nil,
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          html: String.t() | nil,
          mml: String.t() | nil,
          quoted_message_id: String.t() | nil,
          user_id: String.t() | nil,
          restricted_visibility: [String.t()] | nil,
          pinned: boolean() | nil,
          mentioned_users: [String.t()] | nil,
          show_in_channel: boolean() | nil,
          parent_id: String.t() | nil,
          pin_expires: float() | nil,
          pinned_at: String.t() | nil,
          poll_id: String.t() | nil
        }
end