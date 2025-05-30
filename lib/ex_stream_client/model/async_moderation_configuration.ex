defmodule ExStreamClient.Model.AsyncModerationConfiguration do
  @moduledoc "Schema representing a AsyncModerationConfiguration"
  use ExStreamClient.Jason
  defstruct [:callback, :timeout_ms]
  @nested_components %{callback: ExStreamClient.Model.AsyncModerationCallbackConfig}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          callback: ExStreamClient.Model.AsyncModerationCallbackConfig.t() | nil,
          timeout_ms: integer() | nil
        }
end
