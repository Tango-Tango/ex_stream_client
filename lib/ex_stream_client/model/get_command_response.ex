defmodule ExStreamClient.Model.GetCommandResponse do
  @moduledoc "Schema representing a GetCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:args, :description, :duration, :name, :set]
  defstruct [:args, :name, :set, :description, :duration, :created_at, :updated_at]

  @type t :: %__MODULE__{
          args: String.t(),
          name: String.t(),
          set: String.t(),
          description: String.t(),
          duration: String.t(),
          created_at: float() | nil,
          updated_at: float() | nil
        }
end