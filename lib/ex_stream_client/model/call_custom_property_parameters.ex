defmodule ExStreamClient.Model.CallCustomPropertyParameters do
  @moduledoc "Schema representing a CallCustomPropertyParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:operator, :property_key]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{operator: String.t() | nil, property_key: String.t() | nil}
end
