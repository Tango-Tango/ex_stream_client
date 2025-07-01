defmodule ExStreamClient.Model.BodyguardRule do
  @moduledoc "Schema representing a BodyguardRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :label, :severity_rules]
  defstruct [:action, :label, :severity_rules]
  @nested_components action: :enum, severity_rules: ExStreamClient.Model.BodyguardSeverityRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          label: String.t(),
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()]
        }
end
