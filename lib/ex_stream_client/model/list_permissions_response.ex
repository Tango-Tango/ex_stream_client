defmodule ExStreamClient.Model.ListPermissionsResponse do
  @moduledoc "Schema representing a ListPermissionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :permissions]
  defstruct [:duration, :permissions]
  @type t :: %__MODULE__{duration: String.t(), permissions: [ExStreamClient.Model.Permission.t()]}
end