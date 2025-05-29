defmodule ExStreamClient.Model.ModerationFlagResponse do
  @moduledoc "Schema representing a ModerationFlagResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :entity_id, :entity_type, :id, :type, :updated_at]
  defstruct [
    :id,
    :reason,
    :type,
    :user,
    :result,
    :labels,
    :custom,
    :created_at,
    :updated_at,
    :review_queue_item_id,
    :review_queue_item,
    :entity_id,
    :entity_type,
    :entity_creator_id,
    :moderation_payload
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          reason: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          result: [map()] | nil,
          labels: [String.t()] | nil,
          custom: map() | nil,
          created_at: String.t(),
          updated_at: String.t(),
          review_queue_item_id: String.t() | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          entity_creator_id: String.t() | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil
        }
end