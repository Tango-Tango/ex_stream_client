defmodule ExStreamClient.Model.UpsertModerationRuleResponse do
  @moduledoc "Schema representing a UpsertModerationRuleResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :rule]
  @nested_components rule: ExStreamClient.Model.ModerationRuleV2Response
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          rule: ExStreamClient.Model.ModerationRuleV2Response.t() | nil
        }
end
