defmodule ExStreamClient.Model.LimitsSettings do
  @moduledoc "Schema representing a LimitsSettings"
  use ExStreamClient.Jason
  defstruct [:max_duration_seconds, :max_participants]
  @type t :: %__MODULE__{max_duration_seconds: integer() | nil, max_participants: integer() | nil}
end