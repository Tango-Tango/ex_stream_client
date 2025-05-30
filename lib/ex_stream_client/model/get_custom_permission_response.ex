defmodule ExStreamClient.Model.GetCustomPermissionResponse do
  @moduledoc "Schema representing a GetCustomPermissionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :permission]
  defstruct [:duration, :permission]
  @nested_components %{permission: ExStreamClient.Model.Permission}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), permission: ExStreamClient.Model.Permission.t()}
end
