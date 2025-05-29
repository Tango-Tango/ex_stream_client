defmodule ExStreamClient.Model.FrameRecordingResponse do
  @moduledoc "Schema representing a FrameRecordingResponse"
  use ExStreamClient.Jason
  @enforce_keys [:status]
  defstruct [:status]
  @type t :: %__MODULE__{status: String.t()}
end