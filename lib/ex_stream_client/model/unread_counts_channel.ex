defmodule ExStreamClient.Model.UnreadCountsChannel do
  @moduledoc "Schema representing a UnreadCountsChannel"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :last_read, :unread_count]
  defstruct [:channel_id, :last_read, :unread_count]
  @type t :: %__MODULE__{channel_id: String.t(), last_read: float(), unread_count: integer()}
end