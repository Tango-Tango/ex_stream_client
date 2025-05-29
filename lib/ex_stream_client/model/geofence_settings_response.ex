defmodule ExStreamClient.Model.GeofenceSettingsResponse do
  @moduledoc "Schema representing a GeofenceSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:names]
  defstruct [:names]
  @type t :: %__MODULE__{names: [String.t()]}
end