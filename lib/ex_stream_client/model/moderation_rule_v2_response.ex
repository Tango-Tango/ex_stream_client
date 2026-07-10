defmodule ExStreamClient.Model.ModerationRuleV2Response do
  @moduledoc "Schema representing a ModerationRuleV2Response"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :config_keys,
    :created_at,
    :description,
    :enabled,
    :id,
    :name,
    :rule_type,
    :team,
    :updated_at
  ]
  defstruct [
    :action,
    :action_sequences,
    :conditions,
    :config_keys,
    :cooldown_period,
    :created_at,
    :description,
    :enabled,
    :groups,
    :id,
    :logic,
    :name,
    :rule_type,
    :team,
    :updated_at
  ]

  @nested_components action: ExStreamClient.Model.RuleBuilderAction,
                     action_sequences: ExStreamClient.Model.CallRuleActionSequence,
                     conditions: ExStreamClient.Model.RuleBuilderCondition,
                     created_at: :datetime,
                     groups: ExStreamClient.Model.RuleBuilderConditionGroup,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          action_sequences: [ExStreamClient.Model.CallRuleActionSequence.t()] | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          config_keys: [String.t()],
          cooldown_period: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          description: String.t(),
          enabled: boolean(),
          groups: [ExStreamClient.Model.RuleBuilderConditionGroup.t()] | nil,
          id: String.t(),
          logic: String.t() | nil,
          name: String.t(),
          rule_type: String.t(),
          team: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
