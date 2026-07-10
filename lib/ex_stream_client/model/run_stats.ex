defmodule ExStreamClient.Model.RunStats do
  @moduledoc "Schema representing a RunStats"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:channels_deleted, :messages_deleted]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{channels_deleted: integer() | nil, messages_deleted: integer() | nil}
end
