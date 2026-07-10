defmodule ExStreamClient.Model.CallTypeRuleParameters do
  @moduledoc "Schema representing a CallTypeRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:call_type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{call_type: String.t() | nil}
end
