defmodule ExStreamClient.Model.UnblockActionRequestPayload do
  @moduledoc "Schema representing a UnblockActionRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:decision_reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{decision_reason: String.t() | nil}
end
