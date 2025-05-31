defmodule ExStreamClient.Model.BodyguardSeverityRule do
  @moduledoc "Schema representing a BodyguardSeverityRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :severity]
  defstruct [:action, :severity]
  @nested_components action: :atom, severity: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          severity: :critical | :high | :medium | :low
        }
end
