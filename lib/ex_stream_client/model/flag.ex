defmodule ExStreamClient.Model.Flag do
  @moduledoc "Schema representing a Flag"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :entity_id, :entity_type, :result, :updated_at]
  defstruct [
    :created_at,
    :custom,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :is_streamed_content,
    :labels,
    :moderation_payload,
    :moderation_payload_hash,
    :reason,
    :result,
    :review_queue_item,
    :review_queue_item_id,
    :type,
    :updated_at,
    :user
  ]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map() | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          is_streamed_content: boolean() | nil,
          labels: [String.t()] | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          moderation_payload_hash: String.t() | nil,
          reason: String.t() | nil,
          result: [map()],
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          review_queue_item_id: String.t() | nil,
          type: String.t() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.User.t() | nil
        }
end