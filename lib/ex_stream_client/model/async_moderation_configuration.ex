defmodule ExStreamClient.Model.AsyncModerationConfiguration do
  @moduledoc "Schema representing a AsyncModerationConfiguration"
  use ExStreamClient.Jason
  defstruct [:callback, :timeout_ms]

  @type t :: %__MODULE__{
          callback: ExStreamClient.Model.AsyncModerationCallbackConfig.t() | nil,
          timeout_ms: integer() | nil
        }
end