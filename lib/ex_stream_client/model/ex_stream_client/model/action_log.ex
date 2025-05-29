defmodule ExStreamClient.Model.ActionLog do
  @moduledoc "Schema representing a ActionLog"
  use ExStreamClient.Jason

  @enforce_keys [
    :created_at,
    :custom,
    :id,
    :reason,
    :reporter_type,
    :review_queue_item_id,
    :target_user_id,
    :type
  ]
  defstruct [
    :id,
    :reason,
    :type,
    :user,
    :custom,
    :created_at,
    :target_user,
    :reporter_type,
    :review_queue_item_id,
    :target_user_id,
    :review_queue_item
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          reason: String.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          custom: map(),
          created_at: float(),
          target_user: ExStreamClient.Model.User.t() | nil,
          reporter_type: String.t(),
          review_queue_item_id: String.t(),
          target_user_id: String.t(),
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil
        }
end