defmodule ExStreamClient.Model.ReadReceiptsResponse do
  @moduledoc "Schema representing a ReadReceiptsResponse"
  use ExStreamClient.Jason
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean() | nil}
end