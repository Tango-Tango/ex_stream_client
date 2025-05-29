defmodule ExStreamClient.Model.ModerationCheckCompletedEvent do
  @moduledoc "Schema representing a ModerationCheckCompletedEvent"
  use ExStreamClient.Jason

  @enforce_keys [
    :created_at,
    :custom,
    :entity_id,
    :entity_type,
    :recommended_action,
    :review_queue_item_id,
    :type
  ]
  defstruct [
    :type,
    :custom,
    :created_at,
    :received_at,
    :review_queue_item_id,
    :entity_id,
    :entity_type,
    :recommended_action
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          custom: map(),
          created_at: float(),
          received_at: float() | nil,
          review_queue_item_id: String.t(),
          entity_id: String.t(),
          entity_type: String.t(),
          recommended_action: String.t()
        }
end