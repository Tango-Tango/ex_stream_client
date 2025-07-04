defmodule ExStreamClient.Model.Flag do
  @moduledoc "Schema representing a Flag"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components created_at: :datetime,
                     moderation_payload: ExStreamClient.Model.ModerationPayload,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItem,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          is_streamed_content: boolean() | nil,
          labels: [String.t()] | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          moderation_payload_hash: String.t() | nil,
          reason: String.t() | nil,
          result: [%{optional(String.t()) => any()}],
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          review_queue_item_id: String.t() | nil,
          type: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
