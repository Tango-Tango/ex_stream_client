defmodule ExStreamClient.Model.CheckResponse do
  @moduledoc "Schema representing a CheckResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :recommended_action, :status]
  defstruct [:duration, :item, :recommended_action, :status, :task_id, :triggered_rule]

  @nested_components item: ExStreamClient.Model.ReviewQueueItemResponse,
                     triggered_rule: ExStreamClient.Model.TriggeredRuleResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          recommended_action: String.t(),
          status: String.t(),
          task_id: String.t() | nil,
          triggered_rule: ExStreamClient.Model.TriggeredRuleResponse.t() | nil
        }
end
