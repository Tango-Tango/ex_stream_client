defmodule ExStreamClient.Model.BodyguardRule do
  @moduledoc "Schema representing a BodyguardRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :label, :severity_rules]
  defstruct [:label, :action, :severity_rules]

  @type t :: %__MODULE__{
          label: String.t(),
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          severity_rules: [ExStreamClient.Model.BodyguardSeverityRule.t()]
        }
end