defmodule ExStreamClient.Model.ContentCountRuleParameters do
  @moduledoc "Schema representing a ContentCountRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{threshold: integer() | nil, time_window: String.t() | nil}
end
