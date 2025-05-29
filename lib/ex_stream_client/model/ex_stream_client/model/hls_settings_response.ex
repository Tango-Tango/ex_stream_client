defmodule ExStreamClient.Model.HLSSettingsResponse do
  @moduledoc "Schema representing a HLSSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:auto_on, :enabled, :layout, :quality_tracks]
  defstruct [:enabled, :layout, :auto_on, :quality_tracks]

  @type t :: %__MODULE__{
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t(),
          auto_on: boolean(),
          quality_tracks: [String.t()]
        }
end