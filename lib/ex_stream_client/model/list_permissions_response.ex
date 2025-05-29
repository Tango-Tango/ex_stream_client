defmodule ExStreamClient.Model.ListPermissionsResponse do
  @moduledoc "Schema representing a ListPermissionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :permissions]
  defstruct [:permissions, :duration]
  @type t :: %__MODULE__{permissions: [ExStreamClient.Model.Permission.t()], duration: String.t()}
end