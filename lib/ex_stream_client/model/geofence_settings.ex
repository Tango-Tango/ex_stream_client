defmodule ExStreamClient.Model.GeofenceSettings do
  @moduledoc "Schema representing a GeofenceSettings"
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
