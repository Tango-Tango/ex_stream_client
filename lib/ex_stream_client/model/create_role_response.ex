defmodule ExStreamClient.Model.CreateRoleResponse do
  @moduledoc "Schema representing a CreateRoleResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :role]
  defstruct [:duration, :role]
  @type t :: %__MODULE__{duration: String.t(), role: ExStreamClient.Model.Role.t()}
end