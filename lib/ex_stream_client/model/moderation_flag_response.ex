defmodule ExStreamClient.Model.ModerationFlagResponse do
  @moduledoc "Schema representing a ModerationFlagResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :entity_id, :entity_type, :result, :type, :updated_at, :user_id]
  defstruct [
    :created_at,
    :custom,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :labels,
    :moderation_payload,
    :reason,
    :result,
    :review_queue_item,
    :review_queue_item_id,
    :type,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components created_at: :datetime,
                     moderation_payload: ExStreamClient.Model.ModerationPayloadResponse,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          labels: [String.t()] | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayloadResponse.t() | nil,
          reason: String.t() | nil,
          result: [%{optional(String.t()) => any()}],
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          review_queue_item_id: String.t() | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
