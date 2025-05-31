defmodule ExStreamClient.Model.BlockListRule do
  @moduledoc "Schema representing a BlockListRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :name, :team]
  defstruct [:action, :name, :team]
  @nested_components action: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          name: String.t(),
          team: String.t()
        }
end
