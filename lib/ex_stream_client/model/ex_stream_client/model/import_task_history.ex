defmodule ExStreamClient.Model.ImportTaskHistory do
  @moduledoc "Schema representing a ImportTaskHistory"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :next_state, :prev_state]
  defstruct [:next_state, :created_at, :prev_state]
  @type t :: %__MODULE__{next_state: String.t(), created_at: float(), prev_state: String.t()}
end