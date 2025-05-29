defmodule ExStreamClient.Model.SortParamRequest do
  @moduledoc "Schema representing a SortParamRequest"
  use ExStreamClient.Jason
  defstruct [:field, :direction]
  @type t :: %__MODULE__{field: String.t() | nil, direction: integer() | nil}
end