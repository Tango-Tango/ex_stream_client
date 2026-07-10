defmodule ExStreamClient.Model.LLMRule do
  @moduledoc "Schema representing a LLMRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:description, :label]
  defstruct [:action, :description, :label, :severity_rules]
  @nested_components action: :enum, severity_rules: ExStreamClient.Model.BodyguardSeverityRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action:
            (:keep | :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag) | nil,
          description: String.t(),
          label: String.t(),
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()] | nil
        }
end
