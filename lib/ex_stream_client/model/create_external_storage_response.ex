defmodule ExStreamClient.Model.CreateExternalStorageResponse do
  @moduledoc "Schema representing a CreateExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end