defmodule ExStreamClient.Model.FrameRecordingSettingsResponse do
  @moduledoc "Schema representing a FrameRecordingSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:capture_interval_in_seconds, :mode]
  defstruct [:capture_interval_in_seconds, :mode, :quality]

  @type t :: %__MODULE__{
          capture_interval_in_seconds: integer(),
          mode: :"auto-on" | :disabled | :available,
          quality: String.t() | nil
        }
end