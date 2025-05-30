defmodule ExStreamClient.Model.DeleteUserRequest do
  @moduledoc "Schema representing a DeleteUserRequest"
  use ExStreamClient.Jason

  defstruct [
    :delete_conversation_channels,
    :delete_feeds_content,
    :hard_delete,
    :mark_messages_deleted
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          delete_conversation_channels: boolean() | nil,
          delete_feeds_content: boolean() | nil,
          hard_delete: boolean() | nil,
          mark_messages_deleted: boolean() | nil
        }
end
