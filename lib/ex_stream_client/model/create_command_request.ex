defmodule ExStreamClient.Model.CreateCommandRequest do
  @moduledoc "Schema representing a CreateCommandRequest"
  use ExStreamClient.Jason
  @enforce_keys [:description, :name]
  defstruct [:args, :description, :name, :set]

  @type t :: %__MODULE__{
          args: String.t() | nil,
          description: String.t(),
          name: String.t(),
          set: String.t() | nil
        }
end