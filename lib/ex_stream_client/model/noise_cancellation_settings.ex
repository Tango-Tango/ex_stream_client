defmodule ExStreamClient.Model.NoiseCancellationSettings do
  @moduledoc "Schema representing a NoiseCancellationSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:mode]
  defstruct [:mode]
  @nested_components mode: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{mode: :"auto-on" | :disabled | :available}
end
