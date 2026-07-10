defmodule ExStreamClient.Model.UpsertModerationRuleRequest do
  @moduledoc "Schema representing a UpsertModerationRuleRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name, :rule_type]
  defstruct [
    :action,
    :action_sequences,
    :conditions,
    :config_keys,
    :cooldown_period,
    :description,
    :enabled,
    :groups,
    :logic,
    :name,
    :rule_type,
    :team,
    :user,
    :user_id
  ]

  @nested_components action: ExStreamClient.Model.RuleBuilderAction,
                     action_sequences: ExStreamClient.Model.CallRuleActionSequence,
                     conditions: ExStreamClient.Model.RuleBuilderCondition,
                     groups: ExStreamClient.Model.RuleBuilderConditionGroup,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          action_sequences: [ExStreamClient.Model.CallRuleActionSequence.t()] | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          config_keys: [String.t()] | nil,
          cooldown_period: String.t() | nil,
          description: String.t() | nil,
          enabled: boolean() | nil,
          groups: [ExStreamClient.Model.RuleBuilderConditionGroup.t()] | nil,
          logic: String.t() | nil,
          name: String.t(),
          rule_type: String.t(),
          team: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
