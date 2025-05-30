defmodule ExStreamClient.Model.GetMessageResponse do
  @moduledoc "Schema representing a GetMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message, :pending_message_metadata]
  @nested_components message: ExStreamClient.Model.MessageWithChannelResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageWithChannelResponse.t(),
          pending_message_metadata: map() | nil
        }
end
