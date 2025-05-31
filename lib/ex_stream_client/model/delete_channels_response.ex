defmodule ExStreamClient.Model.DeleteChannelsResponse do
  @moduledoc "Schema representing a DeleteChannelsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :result, :task_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), result: map() | nil, task_id: String.t() | nil}
end
