defmodule ExStreamClient.Model.UnreadCountsChannelType do
  @moduledoc "Schema representing a UnreadCountsChannelType"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_count, :channel_type, :unread_count]
  defstruct [:channel_count, :channel_type, :unread_count]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_count: integer(),
          channel_type: String.t(),
          unread_count: integer()
        }
end
