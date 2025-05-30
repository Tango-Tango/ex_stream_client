defmodule ExStreamClient.Model.LimitsSettings do
  @moduledoc "Schema representing a LimitsSettings"
  use ExStreamClient.Jason
  defstruct [:max_duration_seconds, :max_participants]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_duration_seconds: integer() | nil, max_participants: integer() | nil}
end
