defmodule ExStreamClient.Model.UnblockActionRequest do
  @moduledoc "Schema representing a UnblockActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct []
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
