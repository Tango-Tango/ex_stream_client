defmodule ExStreamClient.Model.RTMPIngress do
  @moduledoc "Schema representing a RTMPIngress"
  use ExStreamClient.Jason
  @enforce_keys [:address]
  defstruct [:address]
  @type t :: %__MODULE__{address: String.t()}
end