defmodule ExStreamClient.Model.RejectAppealRequestPayload do
  @moduledoc "Schema representing a RejectAppealRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:decision_reason]
  defstruct [:decision_reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{decision_reason: String.t()}
end
