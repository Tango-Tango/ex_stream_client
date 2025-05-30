defmodule ExStreamClient.Model.GetManyMessagesResponse do
  @moduledoc "Schema representing a GetManyMessagesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :messages]
  defstruct [:duration, :messages]
  @nested_components messages: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()]
        }
end
