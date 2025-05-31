defmodule ExStreamClient.Model.ListPermissionsResponse do
  @moduledoc "Schema representing a ListPermissionsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :permissions]
  defstruct [:duration, :permissions]
  @nested_components permissions: ExStreamClient.Model.Permission
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), permissions: [ExStreamClient.Model.Permission.t()]}
end
