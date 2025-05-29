defmodule ExStreamClient.Model.BackstageSettings do
  @moduledoc "Schema representing a BackstageSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :join_ahead_time_seconds]
  @type t :: %__MODULE__{enabled: boolean(), join_ahead_time_seconds: integer() | nil}
end