defmodule ExStreamClient.Model.SortParamRequest do
  @moduledoc "Schema representing a SortParamRequest"
  use ExStreamClient.Jason
  defstruct [:direction, :field]
  @type t :: %__MODULE__{direction: integer() | nil, field: String.t() | nil}
end