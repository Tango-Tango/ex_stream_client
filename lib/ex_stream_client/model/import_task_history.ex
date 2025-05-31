defmodule ExStreamClient.Model.ImportTaskHistory do
  @moduledoc "Schema representing a ImportTaskHistory"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :next_state, :prev_state]
  defstruct [:created_at, :next_state, :prev_state]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{created_at: float(), next_state: String.t(), prev_state: String.t()}
end
