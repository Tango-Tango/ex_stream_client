defmodule ExStreamClient.Model.SessionSettings do
  @moduledoc "Schema representing a SessionSettings"
  use ExStreamClient.Jason
  @enforce_keys [:inactivity_timeout_seconds]
  defstruct [:inactivity_timeout_seconds]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{inactivity_timeout_seconds: integer()}
end
