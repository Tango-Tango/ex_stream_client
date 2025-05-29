defmodule ExStreamClient.Model.RuleBuilderRule do
  @moduledoc "Schema representing a RuleBuilderRule"
  use ExStreamClient.Jason
  defstruct [:action, :conditions, :enabled, :id, :name]

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil,
          enabled: boolean() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }
end