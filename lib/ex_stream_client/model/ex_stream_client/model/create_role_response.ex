defmodule ExStreamClient.Model.CreateRoleResponse do
  @moduledoc "Schema representing a CreateRoleResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :role]
  defstruct [:role, :duration]
  @type t :: %__MODULE__{role: ExStreamClient.Model.Role.t(), duration: String.t()}
end