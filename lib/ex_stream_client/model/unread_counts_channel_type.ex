defmodule ExStreamClient.Model.UnreadCountsChannelType do
  @moduledoc "Schema representing a UnreadCountsChannelType"
  use ExStreamClient.Jason
  @enforce_keys [:channel_count, :channel_type, :unread_count]
  defstruct [:channel_type, :unread_count, :channel_count]

  @type t :: %__MODULE__{
          channel_type: String.t(),
          unread_count: integer(),
          channel_count: integer()
        }
end