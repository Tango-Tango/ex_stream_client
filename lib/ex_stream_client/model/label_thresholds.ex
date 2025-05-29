defmodule ExStreamClient.Model.LabelThresholds do
  @moduledoc "Schema representing a LabelThresholds"
  use ExStreamClient.Jason
  defstruct [:block, :flag]
  @type t :: %__MODULE__{block: float() | nil, flag: float() | nil}
end