defmodule ExStreamClient.Model.GeofenceSettingsResponse do
  @moduledoc "Schema representing a GeofenceSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:names]
  defstruct [:names]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{names: [String.t()]}
end
