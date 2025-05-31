defmodule ExStreamClient.Model.RingSettingsResponse do
  @moduledoc "Schema representing a RingSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:auto_cancel_timeout_ms, :incoming_call_timeout_ms, :missed_call_timeout_ms]
  defstruct [:auto_cancel_timeout_ms, :incoming_call_timeout_ms, :missed_call_timeout_ms]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_cancel_timeout_ms: integer(),
          incoming_call_timeout_ms: integer(),
          missed_call_timeout_ms: integer()
        }
end
