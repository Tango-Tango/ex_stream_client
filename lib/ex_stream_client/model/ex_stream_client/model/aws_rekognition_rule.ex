defmodule ExStreamClient.Model.AWSRekognitionRule do
  @moduledoc "Schema representing a AWSRekognitionRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :label, :min_confidence]
  defstruct [:label, :action, :min_confidence]

  @type t :: %__MODULE__{
          label: String.t(),
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          min_confidence: float()
        }
end