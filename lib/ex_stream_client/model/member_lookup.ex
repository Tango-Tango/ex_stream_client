defmodule ExStreamClient.Model.MemberLookup do
  @moduledoc "Schema representing a MemberLookup"
  use ExStreamClient.Jason
  @enforce_keys [:limit]
  defstruct [:limit]
  @type t :: %__MODULE__{limit: integer()}
end