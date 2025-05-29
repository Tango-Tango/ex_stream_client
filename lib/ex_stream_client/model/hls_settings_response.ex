defmodule ExStreamClient.Model.HLSSettingsResponse do
  @moduledoc "Schema representing a HLSSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:auto_on, :enabled, :layout, :quality_tracks]
  defstruct [:auto_on, :enabled, :layout, :quality_tracks]

  @type t :: %__MODULE__{
          auto_on: boolean(),
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t(),
          quality_tracks: [String.t()]
        }
end