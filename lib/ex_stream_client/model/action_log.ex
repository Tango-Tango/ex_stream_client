defmodule ExStreamClient.Model.ActionLog do
  @moduledoc "Schema representing a ActionLog"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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
    :created_at,
    :custom,
    :id,
    :reason,
    :reporter_type,
    :review_queue_item,
    :review_queue_item_id,
    :target_user,
    :target_user_id,
    :type,
    :user
  ]

  @nested_components review_queue_item: ExStreamClient.Model.ReviewQueueItem,
                     target_user: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          id: String.t(),
          reason: String.t(),
          reporter_type: String.t(),
          review_queue_item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          review_queue_item_id: String.t(),
          target_user: ExStreamClient.Model.User.t() | nil,
          target_user_id: String.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
