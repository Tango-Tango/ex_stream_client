defmodule ExStreamClient.Model.ModerationFlagResponse do
  @moduledoc "Schema representing a ModerationFlagResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :entity_id, :entity_type, :id, :type, :updated_at]
  defstruct [
    :created_at,
    :custom,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :id,
    :labels,
    :moderation_payload,
    :reason,
    :result,
    :review_queue_item,
    :review_queue_item_id,
    :type,
    :updated_at,
    :user
  ]

  @nested_components %{
    user: ExStreamClient.Model.UserResponse,
    review_queue_item: ExStreamClient.Model.ReviewQueueItem,
    moderation_payload: ExStreamClient.Model.ModerationPayload
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: String.t(),
          custom: map() | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          id: String.t(),
          labels: [String.t()] | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          reason: String.t() | nil,
          result: [map()] | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          review_queue_item_id: String.t() | nil,
          type: String.t(),
          updated_at: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
