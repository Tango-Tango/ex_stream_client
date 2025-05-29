defmodule ExStreamClient.Model.BlockListRule do
  @moduledoc "Schema representing a BlockListRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :team]
  defstruct [:action, :name, :team]

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          name: String.t(),
          team: String.t()
        }
end