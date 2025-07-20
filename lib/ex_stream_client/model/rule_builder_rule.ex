defmodule ExStreamClient.Model.RuleBuilderRule do
  @moduledoc "Schema representing a RuleBuilderRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :enabled, :id, :name, :rule_type]
  defstruct [
    :action,
    :conditions,
    :cooldown_period,
    :enabled,
    :groups,
    :id,
    :logic,
    :name,
    :rule_type
  ]

  @nested_components action: ExStreamClient.Model.RuleBuilderAction,
                     conditions: ExStreamClient.Model.RuleBuilderCondition,
                     groups: ExStreamClient.Model.RuleBuilderConditionGroup
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t(),
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          cooldown_period: String.t() | nil,
          enabled: boolean(),
          groups: [ExStreamClient.Model.RuleBuilderConditionGroup.t()] | nil,
          id: String.t(),
          logic: String.t() | nil,
          name: String.t(),
          rule_type: String.t()
        }
end
