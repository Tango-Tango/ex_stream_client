defmodule ExStreamClient.Model.DeleteCommandResponse do
  @moduledoc "Schema representing a DeleteCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :name]
  defstruct [:name, :duration]
  @type t :: %__MODULE__{name: String.t(), duration: String.t()}
end