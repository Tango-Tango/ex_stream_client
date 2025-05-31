defmodule ExStreamClient.Model.LimitsSettingsResponse do
  @moduledoc "Schema representing a LimitsSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:max_duration_seconds, :max_participants]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_duration_seconds: integer() | nil, max_participants: integer() | nil}
end
