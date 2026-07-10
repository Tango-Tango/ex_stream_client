defmodule ExStreamClient.Model.ChannelMessageCountRuleParameters do
  @moduledoc "Schema representing a ChannelMessageCountRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:operator, :threshold]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{operator: String.t() | nil, threshold: integer() | nil}
end
