defmodule ExStreamClient.Model.DeleteChannelsResponse do
  @moduledoc "Schema representing a DeleteChannelsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :result, :task_id]
  @type t :: %__MODULE__{duration: String.t(), result: map() | nil, task_id: String.t() | nil}
end