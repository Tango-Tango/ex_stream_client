defmodule ExStreamClient.Model.UserCreatedWithinParameters do
  @moduledoc "Schema representing a UserCreatedWithinParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:max_age]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_age: String.t() | nil}
end
