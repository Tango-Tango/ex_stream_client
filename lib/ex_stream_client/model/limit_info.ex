defmodule ExStreamClient.Model.LimitInfo do
  @moduledoc "Schema representing a LimitInfo"
  use ExStreamClient.Jason
  @enforce_keys [:limit, :remaining, :reset]
  defstruct [:limit, :remaining, :reset]
  @type t :: %__MODULE__{limit: integer(), remaining: integer(), reset: integer()}
end