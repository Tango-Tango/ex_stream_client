defmodule ExStreamClient.Model.ImageContentParameters do
  @moduledoc "Schema representing a ImageContentParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:harm_labels, :label_operator, :min_confidence]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          harm_labels: [String.t()] | nil,
          label_operator: String.t() | nil,
          min_confidence: float() | nil
        }
end
