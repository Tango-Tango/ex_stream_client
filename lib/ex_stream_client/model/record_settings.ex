defmodule ExStreamClient.Model.RecordSettings do
  @moduledoc "Schema representing a RecordSettings"
  use ExStreamClient.Jason
  @enforce_keys [:mode]
  defstruct [:mode, :quality, :audio_only, :layout]

  @type t :: %__MODULE__{
          mode: String.t(),
          quality: String.t() | nil,
          audio_only: boolean() | nil,
          layout: ExStreamClient.Model.LayoutSettings.t() | nil
        }
end