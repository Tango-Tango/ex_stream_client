defmodule ExStreamClient.Model.UpdateMessageResponse do
  @moduledoc "Schema representing a UpdateMessageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message, :pending_message_metadata]
  @nested_components message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t(),
          pending_message_metadata: %{optional(String.t()) => String.t()} | nil
        }
end
