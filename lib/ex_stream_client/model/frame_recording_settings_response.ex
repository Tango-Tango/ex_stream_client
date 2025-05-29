defmodule ExStreamClient.Model.FrameRecordingSettingsResponse do
  @moduledoc "Schema representing a FrameRecordingSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:capture_interval_in_seconds, :mode]
  defstruct [:mode, :capture_interval_in_seconds, :quality]

  @type t :: %__MODULE__{
          mode: :"auto-on" | :disabled | :available,
          capture_interval_in_seconds: integer(),
          quality: String.t() | nil
        }
end