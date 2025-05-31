defmodule ExStreamClient.Model.DraftPayloadResponse do
  @moduledoc "Schema representing a DraftPayloadResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:custom, :id, :text]
  defstruct [
    :attachments,
    :custom,
    :html,
    :id,
    :mentioned_users,
    :mml,
    :parent_id,
    :poll_id,
    :quoted_message_id,
    :show_in_channel,
    :silent,
    :text,
    :type
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment,
                     mentioned_users: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          custom: map(),
          html: String.t() | nil,
          id: String.t(),
          mentioned_users: [ExStreamClient.Model.UserResponse.t()] | nil,
          mml: String.t() | nil,
          parent_id: String.t() | nil,
          poll_id: String.t() | nil,
          quoted_message_id: String.t() | nil,
          show_in_channel: boolean() | nil,
          silent: boolean() | nil,
          text: String.t(),
          type: String.t() | nil
        }
end
