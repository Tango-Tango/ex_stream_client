defmodule ExStreamClient.Model.DeleteCommandResponse do
  @moduledoc "Schema representing a DeleteCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :name]
  defstruct [:duration, :name]
  @type t :: %__MODULE__{duration: String.t(), name: String.t()}
end