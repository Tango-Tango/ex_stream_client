defmodule ExStreamClient.Model.TargetResolution do
  @moduledoc "Schema representing a TargetResolution"
  use ExStreamClient.Jason
  @enforce_keys [:bitrate, :height, :width]
  defstruct [:width, :height, :bitrate]
  @type t :: %__MODULE__{width: integer(), height: integer(), bitrate: integer()}
end