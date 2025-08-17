defmodule ExStreamClient.Model.UserRuleParameters do
  @moduledoc "Schema representing a UserRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:max_age]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_age: String.t() | nil}
end
