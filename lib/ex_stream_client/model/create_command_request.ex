defmodule ExStreamClient.Model.CreateCommandRequest do
  @moduledoc "Schema representing a CreateCommandRequest"
  use ExStreamClient.Jason
  @enforce_keys [:description, :name]
  defstruct [:args, :name, :set, :description]

  @type t :: %__MODULE__{
          args: String.t() | nil,
          name: String.t(),
          set: String.t() | nil,
          description: String.t()
        }
end