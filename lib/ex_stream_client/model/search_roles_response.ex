defmodule ExStreamClient.Model.SearchRolesResponse do
  @moduledoc "Schema representing a SearchRolesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :roles]
  defstruct [:duration, :roles]
  @nested_components roles: ExStreamClient.Model.Role
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), roles: [ExStreamClient.Model.Role.t()]}
end
