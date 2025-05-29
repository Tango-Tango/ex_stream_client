defmodule ExStreamClient.Model.PaginationParams do
  @moduledoc "Schema representing a PaginationParams"
  use ExStreamClient.Jason
  defstruct [:offset, :limit]
  @type t :: %__MODULE__{offset: integer() | nil, limit: integer() | nil}
end