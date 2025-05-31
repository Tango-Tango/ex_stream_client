defmodule ExStreamClient.Model.AITextConfig do
  @moduledoc "Schema representing a AITextConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled, :profile, :rules, :severity_rules]
  defstruct [:async, :enabled, :profile, :rules, :severity_rules]

  @nested_components rules: ExStreamClient.Model.BodyguardRule,
                     severity_rules: ExStreamClient.Model.BodyguardSeverityRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          profile: String.t(),
          rules: [ExStreamClient.Model.BodyguardRule.t()],
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()]
        }
end
