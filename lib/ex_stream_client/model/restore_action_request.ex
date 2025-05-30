defmodule ExStreamClient.Model.RestoreActionRequest do
  @moduledoc "Schema representing a RestoreActionRequest"
  use ExStreamClient.Jason
  defstruct []
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
