defmodule ExStreamClient.Model.BodyguardSeverityRule do
  @moduledoc "Schema representing a BodyguardSeverityRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :severity]
  defstruct [:action, :severity]

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          severity: :critical | :high | :medium | :low
        }
end