defmodule ExStreamClient.Model.ModerationFlagResponse do
  @moduledoc "Schema representing a ModerationFlagResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components moderation_payload: ExStreamClient.Model.ModerationPayload,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          id: String.t(),
          labels: [String.t()] | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          reason: String.t() | nil,
          result: [%{optional(String.t()) => any()}] | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          review_queue_item_id: String.t() | nil,
          type: String.t(),
          updated_at: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
