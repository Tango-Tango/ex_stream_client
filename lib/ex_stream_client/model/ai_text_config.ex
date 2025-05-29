defmodule ExStreamClient.Model.AITextConfig do
  @moduledoc "Schema representing a AITextConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :profile, :rules, :severity_rules]
  defstruct [:async, :enabled, :profile, :rules, :severity_rules]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          profile: String.t(),
          rules: [ExStreamClient.Model.BodyguardRule.t()],
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()]
        }
end