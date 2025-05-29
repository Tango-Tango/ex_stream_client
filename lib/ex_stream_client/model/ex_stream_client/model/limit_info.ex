defmodule ExStreamClient.Model.LimitInfo do
  @moduledoc "Schema representing a LimitInfo"
  use ExStreamClient.Jason
  @enforce_keys [:limit, :remaining, :reset]
  defstruct [:reset, :limit, :remaining]
  @type t :: %__MODULE__{reset: integer(), limit: integer(), remaining: integer()}
end