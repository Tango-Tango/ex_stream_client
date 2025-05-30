defmodule ExStreamClient.Model.DeleteMessageResponse do
  @moduledoc "Schema representing a DeleteMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message]
  @nested_components message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), message: ExStreamClient.Model.MessageResponse.t()}
end
