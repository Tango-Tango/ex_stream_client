defmodule ExStreamClient.Model.DeleteUserRequest do
  @moduledoc "Schema representing a DeleteUserRequest"
  use ExStreamClient.Jason

  defstruct [
    :hard_delete,
    :delete_conversation_channels,
    :delete_feeds_content,
    :mark_messages_deleted
  ]

  @type t :: %__MODULE__{
          hard_delete: boolean() | nil,
          delete_conversation_channels: boolean() | nil,
          delete_feeds_content: boolean() | nil,
          mark_messages_deleted: boolean() | nil
        }
end