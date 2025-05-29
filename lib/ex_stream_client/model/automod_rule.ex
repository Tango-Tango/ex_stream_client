defmodule ExStreamClient.Model.AutomodRule do
  @moduledoc "Schema representing a AutomodRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :label, :threshold]
  defstruct [:label, :action, :threshold]

  @type t :: %__MODULE__{
          label: String.t(),
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          threshold: float()
        }
end