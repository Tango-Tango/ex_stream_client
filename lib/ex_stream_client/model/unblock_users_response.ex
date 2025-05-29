defmodule ExStreamClient.Model.UnblockUsersResponse do
  @moduledoc "Schema representing a UnblockUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end