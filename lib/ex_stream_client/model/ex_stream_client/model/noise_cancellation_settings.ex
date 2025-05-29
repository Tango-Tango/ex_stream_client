defmodule ExStreamClient.Model.NoiseCancellationSettings do
  @moduledoc "Schema representing a NoiseCancellationSettings"
  use ExStreamClient.Jason
  @enforce_keys [:mode]
  defstruct [:mode]
  @type t :: %__MODULE__{mode: :"auto-on" | :disabled | :available}
end