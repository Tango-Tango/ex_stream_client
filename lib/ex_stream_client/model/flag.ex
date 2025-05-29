defmodule ExStreamClient.Model.Flag do
  @moduledoc "Schema representing a Flag"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :entity_id, :entity_type, :result, :updated_at]
  defstruct [
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
    :moderation_payload,
    :is_streamed_content,
    :moderation_payload_hash
  ]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          type: String.t() | nil,
          user: ExStreamClient.Model.User.t() | nil,
          result: [map()],
          labels: [String.t()] | nil,
          custom: map() | nil,
          created_at: float(),
          updated_at: float(),
          review_queue_item_id: String.t() | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          entity_creator_id: String.t() | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          is_streamed_content: boolean() | nil,
          moderation_payload_hash: String.t() | nil
        }
end