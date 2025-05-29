defmodule ExStreamClient.Model.ReadStateResponse do
  @moduledoc "Schema representing a ReadStateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:last_read, :unread_messages, :user]
  defstruct [:user, :last_read_message_id, :last_read, :unread_messages]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t(),
          last_read_message_id: String.t() | nil,
          last_read: float(),
          unread_messages: integer()
        }
end