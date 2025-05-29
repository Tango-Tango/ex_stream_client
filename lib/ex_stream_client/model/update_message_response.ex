defmodule ExStreamClient.Model.UpdateMessageResponse do
  @moduledoc "Schema representing a UpdateMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message, :pending_message_metadata]

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t(),
          pending_message_metadata: map() | nil
        }
end