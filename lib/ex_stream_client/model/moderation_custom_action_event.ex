defmodule ExStreamClient.Model.ModerationCustomActionEvent do
  @moduledoc "Schema representing a ModerationCustomActionEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_id, :created_at, :custom, :review_queue_item, :type]
  defstruct [
    :action_id,
    :action_options,
    :created_at,
    :custom,
    :message,
    :received_at,
    :review_queue_item,
    :type
  ]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_id: String.t(),
          action_options: %{optional(String.t()) => any()} | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t(),
          type: String.t()
        }
end
