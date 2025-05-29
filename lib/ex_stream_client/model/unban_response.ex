defmodule ExStreamClient.Model.UnbanResponse do
  @moduledoc "Schema representing a UnbanResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end