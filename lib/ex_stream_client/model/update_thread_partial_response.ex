defmodule ExStreamClient.Model.UpdateThreadPartialResponse do
  @moduledoc "Schema representing a UpdateThreadPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :thread]
  defstruct [:duration, :thread]
  @type t :: %__MODULE__{duration: String.t(), thread: ExStreamClient.Model.ThreadResponse.t()}
end