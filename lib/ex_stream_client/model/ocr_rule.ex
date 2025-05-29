defmodule ExStreamClient.Model.OCRRule do
  @moduledoc "Schema representing a OCRRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :label]
  defstruct [:label, :action]

  @type t :: %__MODULE__{
          label: String.t(),
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag
        }
end