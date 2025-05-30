defmodule ExStreamClient.Model.RuleBuilderConfig do
  @moduledoc "Schema representing a RuleBuilderConfig"
  use ExStreamClient.Jason
  defstruct [:async, :enabled, :rules]
  @nested_components %{rules: ExStreamClient.Model.RuleBuilderRule}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          rules: [ExStreamClient.Model.RuleBuilderRule.t()] | nil
        }
end
