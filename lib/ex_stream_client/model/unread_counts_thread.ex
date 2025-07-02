defmodule ExStreamClient.Model.UnreadCountsThread do
  @moduledoc "Schema representing a UnreadCountsThread"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:last_read, :last_read_message_id, :parent_message_id, :unread_count]
  defstruct [:last_read, :last_read_message_id, :parent_message_id, :unread_count]
  @nested_components last_read: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          last_read: DateTime.t() | integer() | String.t(),
          last_read_message_id: String.t(),
          parent_message_id: String.t(),
          unread_count: integer()
        }
end
