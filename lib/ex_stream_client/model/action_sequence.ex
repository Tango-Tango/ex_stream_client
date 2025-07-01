defmodule ExStreamClient.Model.ActionSequence do
  @moduledoc "Schema representing a ActionSequence"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :action,
    :blur,
    :cooldown_period,
    :threshold,
    :time_window,
    :warning,
    :warning_text
  ]
  defstruct [:action, :blur, :cooldown_period, :threshold, :time_window, :warning, :warning_text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          blur: boolean(),
          cooldown_period: integer(),
          threshold: integer(),
          time_window: integer(),
          warning: boolean(),
          warning_text: String.t()
        }
end
