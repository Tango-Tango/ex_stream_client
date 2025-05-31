defmodule ExStreamClient.Model.UpdateBlockListRequest do
  @moduledoc "Schema representing a UpdateBlockListRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:team, :words]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{team: String.t() | nil, words: [String.t()] | nil}
end
