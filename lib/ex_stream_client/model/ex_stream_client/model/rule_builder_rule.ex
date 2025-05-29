defmodule ExStreamClient.Model.RuleBuilderRule do
  @moduledoc "Schema representing a RuleBuilderRule"
  use ExStreamClient.Jason
  defstruct [:enabled, :id, :name, :action, :conditions]

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          action: ExStreamClient.Model.RuleBuilderAction.t() | nil,
          conditions: [ExStreamClient.Model.RuleBuilderCondition.t()] | nil
        }
end