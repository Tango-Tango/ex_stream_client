defmodule ExStreamClient.Model.HLSSettings do
  @moduledoc "Schema representing a HLSSettings"
  use ExStreamClient.Jason
  @enforce_keys [:auto_on, :enabled, :quality_tracks]
  defstruct [:enabled, :layout, :auto_on, :quality_tracks]

  @type t :: %__MODULE__{
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          auto_on: boolean(),
          quality_tracks: [String.t()]
        }
end