defmodule ExStreamClient.Model.ActionLogResponse do
  @moduledoc "Schema representing a ActionLogResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :id, :reason, :target_user_id, :type, :user_id]
  defstruct [
    :created_at,
    :custom,
    :id,
    :reason,
    :review_queue_item,
    :target_user,
    :target_user_id,
    :type,
    :user,
    :user_id
  ]

  @nested_components %{
    user: ExStreamClient.Model.UserResponse,
    review_queue_item: ExStreamClient.Model.ReviewQueueItem,
    target_user: ExStreamClient.Model.UserResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          id: String.t(),
          reason: String.t(),
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          target_user: ExStreamClient.Model.UserResponse.t() | nil,
          target_user_id: String.t(),
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
