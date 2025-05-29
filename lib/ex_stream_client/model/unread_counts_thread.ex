defmodule ExStreamClient.Model.UnreadCountsThread do
  @moduledoc "Schema representing a UnreadCountsThread"
  use ExStreamClient.Jason
  @enforce_keys [:last_read, :last_read_message_id, :parent_message_id, :unread_count]
  defstruct [:last_read, :last_read_message_id, :parent_message_id, :unread_count]

  @type t :: %__MODULE__{
          last_read: float(),
          last_read_message_id: String.t(),
          parent_message_id: String.t(),
          unread_count: integer()
        }
end