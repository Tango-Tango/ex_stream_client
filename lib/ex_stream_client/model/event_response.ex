defmodule ExStreamClient.Model.EventResponse do
  @moduledoc "Schema representing a EventResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :event]
  defstruct [:duration, :event]
  @type t :: %__MODULE__{duration: String.t(), event: ExStreamClient.Model.WSEvent.t()}
end