defmodule ExStreamClient.Model.ImageRuleParameters do
  @moduledoc "Schema representing a ImageRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:harm_labels, :min_confidence, :threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          harm_labels: [String.t()] | nil,
          min_confidence: float() | nil,
          threshold: integer() | nil,
          time_window: String.t() | nil
        }
end
