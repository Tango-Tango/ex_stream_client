defmodule ExStreamClient.Model.ListRolesResponse do
  @moduledoc "Schema representing a ListRolesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :roles]
  defstruct [:duration, :roles]
  @nested_components %{roles: ExStreamClient.Model.Role}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), roles: [ExStreamClient.Model.Role.t()]}
end
