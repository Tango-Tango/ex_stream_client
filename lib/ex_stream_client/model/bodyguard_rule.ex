defmodule ExStreamClient.Model.BodyguardRule do
  @moduledoc "Schema representing a BodyguardRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:label]
  defstruct [:action, :label, :severity_rules]
  @nested_components action: :enum, severity_rules: ExStreamClient.Model.BodyguardSeverityRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action:
            (:bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag | :keep) | nil,
          label: String.t(),
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()] | nil
        }
end
