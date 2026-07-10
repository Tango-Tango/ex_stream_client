defmodule ExStreamClient.Model.ActionSequence do
  @moduledoc "Schema representing a ActionSequence"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:action, :blur, :cooldown_period, :threshold, :time_window, :warning, :warning_text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t() | nil,
          blur: boolean() | nil,
          cooldown_period: integer() | nil,
          threshold: integer() | nil,
          time_window: integer() | nil,
          warning: boolean() | nil,
          warning_text: String.t() | nil
        }
end
