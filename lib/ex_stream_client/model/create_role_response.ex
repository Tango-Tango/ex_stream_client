defmodule ExStreamClient.Model.CreateRoleResponse do
  @moduledoc "Schema representing a CreateRoleResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :role]
  defstruct [:duration, :role]
  @nested_components role: ExStreamClient.Model.Role
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), role: ExStreamClient.Model.Role.t()}
end
