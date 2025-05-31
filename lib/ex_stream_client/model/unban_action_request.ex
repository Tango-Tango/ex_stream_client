defmodule ExStreamClient.Model.UnbanActionRequest do
  @moduledoc "Schema representing a UnbanActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct []
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
