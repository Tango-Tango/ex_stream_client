defmodule ExStreamClient.Model.UnreadCountsChannel do
  @moduledoc "Schema representing a UnreadCountsChannel"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :last_read, :unread_count]
  defstruct [:channel_id, :last_read, :unread_count]
  @nested_components last_read: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          last_read: DateTime.t() | integer() | String.t(),
          unread_count: integer()
        }
end
