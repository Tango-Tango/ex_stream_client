defmodule ExStreamClient.Model.UnbanResponse do
  @moduledoc "Schema representing a UnbanResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t()}
end
