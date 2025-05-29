defmodule ExStreamClient.Model.DraftPayloadResponse do
  @moduledoc "Schema representing a DraftPayloadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :id, :text]
  defstruct [
    :id,
    :silent,
    :type,
    :text,
    :custom,
    :attachments,
    :html,
    :mml,
    :quoted_message_id,
    :mentioned_users,
    :show_in_channel,
    :parent_id,
    :poll_id
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          silent: boolean() | nil,
          type: String.t() | nil,
          text: String.t(),
          custom: map(),
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          html: String.t() | nil,
          mml: String.t() | nil,
          quoted_message_id: String.t() | nil,
          mentioned_users: [ExStreamClient.Model.UserResponse.t()] | nil,
          show_in_channel: boolean() | nil,
          parent_id: String.t() | nil,
          poll_id: String.t() | nil
        }
end