defmodule ExStreamClient.Model.UpdateUserPartialRequest do
  @moduledoc "Schema representing a UpdateUserPartialRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [:id, :set, :unset]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{id: String.t(), set: map() | nil, unset: [String.t()] | nil}
end
