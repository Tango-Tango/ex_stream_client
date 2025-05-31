defmodule ExStreamClient.Model.RuleBuilderRule do
  @moduledoc "Schema representing a RuleBuilderRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:action, :conditions, :enabled, :id, :name]

  @nested_components action: ExStreamClient.Model.RuleBuilderAction,
                     conditions: ExStreamClient.Model.RuleBuilderCondition
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          enabled: boolean() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }
end
