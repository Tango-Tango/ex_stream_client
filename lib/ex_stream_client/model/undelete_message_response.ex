defmodule ExStreamClient.Model.UndeleteMessageResponse do
  @moduledoc "Schema representing a UndeleteMessageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message]
  @nested_components message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), message: ExStreamClient.Model.MessageResponse.t()}
end
