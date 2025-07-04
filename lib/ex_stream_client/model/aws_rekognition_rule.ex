defmodule ExStreamClient.Model.AWSRekognitionRule do
  @moduledoc "Schema representing a AWSRekognitionRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :label, :min_confidence]
  defstruct [:action, :label, :min_confidence]
  @nested_components action: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          label: String.t(),
          min_confidence: float()
        }
end
