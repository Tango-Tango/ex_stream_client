defmodule ExStreamClient.Model.FrameRecordingResponse do
  @moduledoc "Schema representing a FrameRecordingResponse"
  use ExStreamClient.Jason
  @enforce_keys [:status]
  defstruct [:status]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{status: String.t()}
end
