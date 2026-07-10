defmodule ExStreamClient.Model.MarkReadResponse do
  @moduledoc "Schema representing a MarkReadResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :event]
  @nested_components event: ExStreamClient.Model.MarkReadResponseEvent
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          event: ExStreamClient.Model.MarkReadResponseEvent.t() | nil
        }
end
