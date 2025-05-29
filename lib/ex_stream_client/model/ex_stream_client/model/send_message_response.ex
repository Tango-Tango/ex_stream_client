defmodule ExStreamClient.Model.SendMessageResponse do
  @moduledoc "Schema representing a SendMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:message, :duration, :pending_message_metadata]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t(),
          duration: String.t(),
          pending_message_metadata: map() | nil
        }
end