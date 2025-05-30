defmodule ExStreamClient.Model.PaginationParams do
  @moduledoc "Schema representing a PaginationParams"
  use ExStreamClient.Jason
  defstruct [:limit, :offset]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{limit: integer() | nil, offset: integer() | nil}
end
