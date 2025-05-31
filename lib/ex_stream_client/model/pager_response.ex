defmodule ExStreamClient.Model.PagerResponse do
  @moduledoc "Schema representing a PagerResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:next, :prev]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{next: String.t() | nil, prev: String.t() | nil}
end
