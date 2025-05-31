defmodule ExStreamClient.Model.CreateRoleRequest do
  @moduledoc "Schema representing a CreateRoleRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name]
  defstruct [:name]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{name: String.t()}
end
