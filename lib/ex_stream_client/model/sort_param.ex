defmodule ExStreamClient.Model.SortParam do
  @moduledoc "Schema representing a SortParam"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:direction, :field]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{direction: integer() | nil, field: String.t() | nil}
end
