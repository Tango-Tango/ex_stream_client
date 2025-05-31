defmodule ExStreamClient.Model.UpdateMessagePartialResponse do
  @moduledoc "Schema representing a UpdateMessagePartialResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :message, :pending_message_metadata]
  @nested_components message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          pending_message_metadata: map() | nil
        }
end
