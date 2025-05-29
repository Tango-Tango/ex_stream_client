defmodule ExStreamClient.Model.UserDeletedEvent do
  @moduledoc "Schema representing a UserDeletedEvent"
  use ExStreamClient.Jason

  @enforce_keys [
    :created_at,
    :delete_conversation_channels,
    :hard_delete,
    :mark_messages_deleted,
    :type
  ]
  defstruct [
    :type,
    :user,
    :created_at,
    :hard_delete,
    :delete_conversation_channels,
    :mark_messages_deleted
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          hard_delete: boolean(),
          delete_conversation_channels: boolean(),
          mark_messages_deleted: boolean()
        }
end