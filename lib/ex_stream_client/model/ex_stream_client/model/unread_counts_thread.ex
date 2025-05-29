defmodule ExStreamClient.Model.UnreadCountsThread do
  @moduledoc "Schema representing a UnreadCountsThread"
  use ExStreamClient.Jason
  @enforce_keys [:last_read, :last_read_message_id, :parent_message_id, :unread_count]
  defstruct [:last_read_message_id, :unread_count, :last_read, :parent_message_id]

  @type t :: %__MODULE__{
          last_read_message_id: String.t(),
          unread_count: integer(),
          last_read: float(),
          parent_message_id: String.t()
        }
end