defmodule ExStreamClient.Model.BlockContentOptions do
  @moduledoc "Schema representing a BlockContentOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:reason]
  defstruct [:reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{reason: String.t()}
end
