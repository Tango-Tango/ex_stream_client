defmodule ExStreamClient.Model.RTMPSettings do
  @moduledoc "Schema representing a RTMPSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [:enabled, :layout, :location, :quality_name]

  @nested_components layout: ExStreamClient.Model.LayoutSettings,
                     location: ExStreamClient.Model.RTMPLocation
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          location: ExStreamClient.Model.RTMPLocation.t() | nil,
          quality_name: String.t() | nil
        }
end
