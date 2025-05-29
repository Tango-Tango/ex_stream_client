defmodule ExStreamClient.Model.GeofenceSettings do
  @moduledoc "Schema representing a GeofenceSettings"
  use ExStreamClient.Jason
  @enforce_keys [:names]
  defstruct [:names]
  @type t :: %__MODULE__{names: [String.t()]}
end