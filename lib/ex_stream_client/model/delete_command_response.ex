defmodule ExStreamClient.Model.DeleteCommandResponse do
  @moduledoc "Schema representing a DeleteCommandResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :name]
  defstruct [:duration, :name]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), name: String.t()}
end
