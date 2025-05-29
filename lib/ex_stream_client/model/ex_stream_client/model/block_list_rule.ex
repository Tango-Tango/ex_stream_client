defmodule ExStreamClient.Model.BlockListRule do
  @moduledoc "Schema representing a BlockListRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :team]
  defstruct [:name, :action, :team]

  @type t :: %__MODULE__{
          name: String.t(),
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          team: String.t()
        }
end