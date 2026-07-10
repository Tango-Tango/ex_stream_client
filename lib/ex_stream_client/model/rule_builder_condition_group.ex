defmodule ExStreamClient.Model.RuleBuilderConditionGroup do
  @moduledoc "Schema representing a RuleBuilderConditionGroup"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:conditions, :logic]
  @nested_components conditions: ExStreamClient.Model.RuleBuilderCondition
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          logic: String.t() | nil
        }
end
