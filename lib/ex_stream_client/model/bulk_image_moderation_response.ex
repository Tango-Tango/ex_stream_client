defmodule ExStreamClient.Model.BulkImageModerationResponse do
  @moduledoc "Schema representing a BulkImageModerationResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :task_id]
  defstruct [:duration, :task_id]
  @type t :: %__MODULE__{duration: String.t(), task_id: String.t()}
end