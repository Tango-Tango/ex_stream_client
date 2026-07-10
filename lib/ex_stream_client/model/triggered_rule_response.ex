defmodule ExStreamClient.Model.TriggeredRuleResponse do
  @moduledoc "Schema representing a TriggeredRuleResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:actions, :rule_id]
  defstruct [:actions, :call_options, :rule_id, :rule_name, :violation_number]
  @nested_components call_options: ExStreamClient.Model.CallActionOptions
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          actions: [String.t()],
          call_options: ExStreamClient.Model.CallActionOptions.t() | nil,
          rule_id: String.t(),
          rule_name: String.t() | nil,
          violation_number: integer() | nil
        }
end
