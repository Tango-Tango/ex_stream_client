defmodule ExStreamClient.Model.AITextConfig do
  @moduledoc "Schema representing a AITextConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:async, :enabled, :profile, :rules, :severity_rules]

  @nested_components rules: ExStreamClient.Model.BodyguardRule,
                     severity_rules: ExStreamClient.Model.BodyguardSeverityRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          profile: String.t() | nil,
          rules: [ExStreamClient.Model.BodyguardRule.t()] | nil,
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()] | nil
        }
end
