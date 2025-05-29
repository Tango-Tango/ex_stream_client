defmodule ExStreamClient.Model.CreateRoleRequest do
  @moduledoc "Schema representing a CreateRoleRequest"
  use ExStreamClient.Jason
  @enforce_keys [:name]
  defstruct [:name]
  @type t :: %__MODULE__{name: String.t()}
end