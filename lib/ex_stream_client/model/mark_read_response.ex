defmodule ExStreamClient.Model.MarkReadResponse do
  @moduledoc "Schema representing a MarkReadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :event]
  @nested_components %{event: ExStreamClient.Model.MessageReadEvent}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          event: ExStreamClient.Model.MessageReadEvent.t() | nil
        }
end
