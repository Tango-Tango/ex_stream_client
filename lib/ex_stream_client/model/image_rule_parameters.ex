defmodule ExStreamClient.Model.ImageRuleParameters do
  @moduledoc "Schema representing a ImageRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:threshold, :time_window]
  defstruct [:harm_labels, :threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          harm_labels: [String.t()] | nil,
          threshold: integer(),
          time_window: String.t()
        }
end
