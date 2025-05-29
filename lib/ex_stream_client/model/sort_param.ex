defmodule ExStreamClient.Model.SortParam do
  @moduledoc "Schema representing a SortParam"
  use ExStreamClient.Jason
  defstruct [:field, :direction]
  @type t :: %__MODULE__{field: String.t() | nil, direction: integer() | nil}
end