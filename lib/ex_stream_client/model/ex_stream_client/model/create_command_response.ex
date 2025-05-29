defmodule ExStreamClient.Model.CreateCommandResponse do
  @moduledoc "Schema representing a CreateCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:command, :duration]
  @type t :: %__MODULE__{command: ExStreamClient.Model.Command.t() | nil, duration: String.t()}
end