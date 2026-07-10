defmodule ExStreamClient.Model.UserRoleParameters do
  @moduledoc "Schema representing a UserRoleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:operator, :role]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{operator: String.t() | nil, role: String.t() | nil}
end
