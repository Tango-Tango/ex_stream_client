defmodule ExStreamClient.Model.UpdateMessagePartialResponse do
  @moduledoc "Schema representing a UpdateMessagePartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :message, :pending_message_metadata]

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          pending_message_metadata: map() | nil
        }
end