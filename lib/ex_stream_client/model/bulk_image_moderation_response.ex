defmodule ExStreamClient.Model.BulkImageModerationResponse do
  @moduledoc "Schema representing a BulkImageModerationResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :task_id]
  defstruct [:duration, :task_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), task_id: String.t()}
end
