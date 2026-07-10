defmodule ExStreamClient.Model.ModerationRulesTriggeredEvent do
  @moduledoc "Schema representing a ModerationRulesTriggeredEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :created_at,
    :custom,
    :entity_id,
    :entity_type,
    :rule,
    :triggered_actions,
    :type,
    :user_id
  ]
  defstruct [
    :created_at,
    :custom,
    :entity_id,
    :entity_type,
    :received_at,
    :review_queue_item_id,
    :rule,
    :triggered_actions,
    :type,
    :user_id,
    :violation_number
  ]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     rule: ExStreamClient.Model.ModerationRuleInfo
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          entity_id: String.t(),
          entity_type: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          review_queue_item_id: String.t() | nil,
          rule: ExStreamClient.Model.ModerationRuleInfo.t(),
          triggered_actions: [String.t()],
          type: String.t(),
          user_id: String.t(),
          violation_number: integer() | nil
        }
end
