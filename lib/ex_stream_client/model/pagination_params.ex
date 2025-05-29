defmodule ExStreamClient.Model.PaginationParams do
  @moduledoc "Schema representing a PaginationParams"
  use ExStreamClient.Jason
  defstruct [:limit, :offset]
  @type t :: %__MODULE__{limit: integer() | nil, offset: integer() | nil}
end