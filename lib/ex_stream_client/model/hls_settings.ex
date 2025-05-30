defmodule ExStreamClient.Model.HLSSettings do
  @moduledoc "Schema representing a HLSSettings"
  use ExStreamClient.Jason
  @enforce_keys [:auto_on, :enabled, :quality_tracks]
  defstruct [:auto_on, :enabled, :layout, :quality_tracks]
  @nested_components layout: ExStreamClient.Model.LayoutSettings
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_on: boolean(),
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          quality_tracks: [String.t()]
        }
end
