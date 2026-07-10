defmodule ExStreamClient.Model.AppealResponse do
  @moduledoc "Schema representing a AppealResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:appeal_id, :duration]
  defstruct [:appeal_id, :duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{appeal_id: String.t(), duration: String.t()}
end
