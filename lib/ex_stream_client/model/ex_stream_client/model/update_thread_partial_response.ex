defmodule ExStreamClient.Model.UpdateThreadPartialResponse do
  @moduledoc "Schema representing a UpdateThreadPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :thread]
  defstruct [:thread, :duration]
  @type t :: %__MODULE__{thread: ExStreamClient.Model.ThreadResponse.t(), duration: String.t()}
end