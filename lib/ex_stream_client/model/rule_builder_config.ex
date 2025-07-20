defmodule ExStreamClient.Model.RuleBuilderConfig do
  @moduledoc "Schema representing a RuleBuilderConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:rules]
  defstruct [:async, :rules]
  @nested_components rules: ExStreamClient.Model.RuleBuilderRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          rules: [ExStreamClient.Model.RuleBuilderRule.t()]
        }
end
