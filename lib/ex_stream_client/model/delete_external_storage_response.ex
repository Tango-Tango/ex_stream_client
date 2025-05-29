defmodule ExStreamClient.Model.DeleteExternalStorageResponse do
  @moduledoc "Schema representing a DeleteExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end