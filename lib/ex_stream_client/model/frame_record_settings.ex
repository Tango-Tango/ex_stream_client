defmodule ExStreamClient.Model.FrameRecordSettings do
  @moduledoc "Schema representing a FrameRecordSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:capture_interval_in_seconds, :mode]
  defstruct [:capture_interval_in_seconds, :mode, :quality]
  @nested_components mode: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          capture_interval_in_seconds: integer(),
          mode: :"auto-on" | :disabled | :available,
          quality: String.t() | nil
        }
end
