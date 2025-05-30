defmodule ExStreamClient.Model.TargetResolution do
  @moduledoc "Schema representing a TargetResolution"
  use ExStreamClient.Jason
  @enforce_keys [:bitrate, :height, :width]
  defstruct [:bitrate, :height, :width]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{bitrate: integer(), height: integer(), width: integer()}
end
