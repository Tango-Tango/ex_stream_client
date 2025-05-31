defmodule ExStreamClient.Model.EventResponse do
  @moduledoc "Schema representing a EventResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :event]
  defstruct [:duration, :event]
  @nested_components event: ExStreamClient.Model.WSEvent
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), event: ExStreamClient.Model.WSEvent.t()}
end
