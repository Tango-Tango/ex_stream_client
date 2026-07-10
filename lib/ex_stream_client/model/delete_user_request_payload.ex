defmodule ExStreamClient.Model.DeleteUserRequestPayload do
  @moduledoc "Schema representing a DeleteUserRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :delete_conversation_channels,
    :delete_feeds_content,
    :entity_id,
    :entity_type,
    :hard_delete,
    :mark_messages_deleted,
    :reason
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          delete_conversation_channels: boolean() | nil,
          delete_feeds_content: boolean() | nil,
          entity_id: String.t() | nil,
          entity_type: String.t() | nil,
          hard_delete: boolean() | nil,
          mark_messages_deleted: boolean() | nil,
          reason: String.t() | nil
        }
end
