defmodule ExStreamClient.Model.GetMessageResponse do
  @moduledoc "Schema representing a GetMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:message, :duration, :pending_message_metadata]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageWithChannelResponse.t(),
          duration: String.t(),
          pending_message_metadata: map() | nil
        }
end