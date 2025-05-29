defmodule ExStreamClient.Model.DeleteChannelsResponse do
  @moduledoc "Schema representing a DeleteChannelsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:result, :duration, :task_id]
  @type t :: %__MODULE__{result: map() | nil, duration: String.t(), task_id: String.t() | nil}
end