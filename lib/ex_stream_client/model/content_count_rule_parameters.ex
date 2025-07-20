defmodule ExStreamClient.Model.ContentCountRuleParameters do
  @moduledoc "Schema representing a ContentCountRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:threshold, :time_window]
  defstruct [:threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{threshold: integer(), time_window: String.t()}
end
