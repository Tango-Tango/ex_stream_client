defmodule ExStreamClient.Model.MarkReadResponse do
  @moduledoc "Schema representing a MarkReadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :event]

  @type t :: %__MODULE__{
          duration: String.t(),
          event: ExStreamClient.Model.MessageReadEvent.t() | nil
        }
end