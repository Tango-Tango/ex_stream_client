defmodule ExStreamClient.Model.ActionLogResponse do
  @moduledoc "Schema representing a ActionLogResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :id, :reason, :target_user_id, :type, :user_id]
  defstruct [
    :id,
    :reason,
    :type,
    :user,
    :custom,
    :created_at,
    :user_id,
    :target_user,
    :target_user_id,
    :review_queue_item
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          reason: String.t(),
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          created_at: float(),
          user_id: String.t(),
          target_user: ExStreamClient.Model.UserResponse.t() | nil,
          target_user_id: String.t(),
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil
        }
end