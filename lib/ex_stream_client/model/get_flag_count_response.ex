defmodule ExStreamClient.Model.GetFlagCountResponse do
  @moduledoc "Schema representing a GetFlagCountResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:count, :duration]
  defstruct [:count, :duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{count: integer(), duration: String.t()}
end
