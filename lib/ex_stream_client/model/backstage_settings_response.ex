defmodule ExStreamClient.Model.BackstageSettingsResponse do
  @moduledoc "Schema representing a BackstageSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :join_ahead_time_seconds]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean(), join_ahead_time_seconds: integer() | nil}
end
