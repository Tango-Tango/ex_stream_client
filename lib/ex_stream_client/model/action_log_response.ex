defmodule ExStreamClient.Model.ActionLogResponse do
  @moduledoc "Schema representing a ActionLogResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :ai_providers,
    :created_at,
    :custom,
    :id,
    :reason,
    :reporter_type,
    :target_user_id,
    :type,
    :user_id
  ]
  defstruct [
    :ai_providers,
    :created_at,
    :custom,
    :id,
    :reason,
    :reporter_type,
    :review_queue_item,
    :target_user,
    :target_user_id,
    :type,
    :user,
    :user_id
  ]

  @nested_components created_at: :datetime,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse,
                     target_user: ExStreamClient.Model.UserResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_providers: [String.t()],
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          id: String.t(),
          reason: String.t(),
          reporter_type: String.t(),
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          target_user: ExStreamClient.Model.UserResponse.t() | nil,
          target_user_id: String.t(),
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
