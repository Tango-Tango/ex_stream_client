defmodule ExStreamClient.Model.GetCustomPermissionResponse do
  @moduledoc "Schema representing a GetCustomPermissionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :permission]
  defstruct [:duration, :permission]
  @type t :: %__MODULE__{duration: String.t(), permission: ExStreamClient.Model.Permission.t()}
end