defmodule ExStreamClient.Model.GeofenceSettingsResponse do
  @moduledoc "Schema representing a GeofenceSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:names]
  defstruct [:names]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{names: [String.t()]}
end
