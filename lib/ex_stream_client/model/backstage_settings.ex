defmodule ExStreamClient.Model.BackstageSettings do
  @moduledoc "Schema representing a BackstageSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [:enabled, :join_ahead_time_seconds]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean(), join_ahead_time_seconds: integer() | nil}
end
