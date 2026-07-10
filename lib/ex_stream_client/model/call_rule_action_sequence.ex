defmodule ExStreamClient.Model.CallRuleActionSequence do
  @moduledoc "Schema representing a CallRuleActionSequence"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:actions, :call_options, :violation_number]
  @nested_components call_options: ExStreamClient.Model.CallActionOptions
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          actions: [String.t()] | nil,
          call_options: ExStreamClient.Model.CallActionOptions.t() | nil,
          violation_number: integer() | nil
        }
end
