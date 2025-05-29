defmodule ExStreamClient.Model.UpdateMessagePartialResponse do
  @moduledoc "Schema representing a UpdateMessagePartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:message, :duration, :pending_message_metadata]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          duration: String.t(),
          pending_message_metadata: map() | nil
        }
end