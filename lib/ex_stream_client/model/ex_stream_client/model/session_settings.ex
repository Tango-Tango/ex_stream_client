defmodule ExStreamClient.Model.SessionSettings do
  @moduledoc "Schema representing a SessionSettings"
  use ExStreamClient.Jason
  @enforce_keys [:inactivity_timeout_seconds]
  defstruct [:inactivity_timeout_seconds]
  @type t :: %__MODULE__{inactivity_timeout_seconds: integer()}
end