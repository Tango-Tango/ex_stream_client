defmodule ExStreamClient.Model.LabelThresholds do
  @moduledoc "Schema representing a LabelThresholds"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:block, :flag]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{block: float() | nil, flag: float() | nil}
end
