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
    :created_at,
    :custom,
    :entity_id,
    :entity_type,
    :received_at,
    :recommended_action,
    :review_queue_item_id,
    :type
  ]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          entity_id: String.t(),
          entity_type: String.t(),
          received_at: float() | nil,
          recommended_action: String.t(),
          review_queue_item_id: String.t(),
          type: String.t()
        }
end