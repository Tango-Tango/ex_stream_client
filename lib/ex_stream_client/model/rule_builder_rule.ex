defmodule ExStreamClient.Model.RuleBuilderRule do
  @moduledoc "Schema representing a RuleBuilderRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:rule_type]
  defstruct [
    :action,
    :action_sequences,
    :conditions,
    :cooldown_period,
    :groups,
    :id,
    :logic,
    :rule_type
  ]

  @nested_components action: ExStreamClient.Model.RuleBuilderAction,
                     action_sequences: ExStreamClient.Model.CallRuleActionSequence,
                     conditions: ExStreamClient.Model.RuleBuilderCondition,
                     groups: ExStreamClient.Model.RuleBuilderConditionGroup
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          action_sequences: [ExStreamClient.Model.CallRuleActionSequence.t()] | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          cooldown_period: String.t() | nil,
          groups: [ExStreamClient.Model.RuleBuilderConditionGroup.t()] | nil,
          id: String.t() | nil,
          logic: String.t() | nil,
          rule_type: String.t()
        }
end
