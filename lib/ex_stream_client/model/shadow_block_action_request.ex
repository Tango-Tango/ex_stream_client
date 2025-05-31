defmodule ExStreamClient.Model.ShadowBlockActionRequest do
  @moduledoc "Schema representing a ShadowBlockActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct []
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
