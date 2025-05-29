defmodule ExStreamClient.Model.UnreadCountsChannel do
  @moduledoc "Schema representing a UnreadCountsChannel"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :last_read, :unread_count]
  defstruct [:channel_id, :unread_count, :last_read]
  @type t :: %__MODULE__{channel_id: String.t(), unread_count: integer(), last_read: float()}
end