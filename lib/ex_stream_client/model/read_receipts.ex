defmodule ExStreamClient.Model.ReadReceipts do
  @moduledoc "Schema representing a ReadReceipts"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean()}
end