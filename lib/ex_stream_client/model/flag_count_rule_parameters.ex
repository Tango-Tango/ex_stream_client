defmodule ExStreamClient.Model.FlagCountRuleParameters do
  @moduledoc "Schema representing a FlagCountRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:threshold]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{threshold: integer() | nil}
end
