defmodule ExStreamClient.Model.Command do
  @moduledoc "Schema representing a Command"
  use ExStreamClient.Jason
  @enforce_keys [:args, :description, :name, :set]
  defstruct [:args, :name, :set, :description, :created_at, :updated_at]

  @type t :: %__MODULE__{
          args: String.t(),
          name: String.t(),
          set: String.t(),
          description: String.t(),
          created_at: float() | nil,
          updated_at: float() | nil
        }
end