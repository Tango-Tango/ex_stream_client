defmodule ExStreamClient.Model.ReviewQueueItemUpdatedEvent do
  @moduledoc "Schema representing a ReviewQueueItemUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:action, :created_at, :custom, :flags, :received_at, :review_queue_item, :type]

  @nested_components %{
    flags: ExStreamClient.Model.FlagResponse,
    action: ExStreamClient.Model.ActionLogResponse,
    review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.ActionLogResponse.t() | nil,
          created_at: float(),
          custom: map(),
          flags: [ExStreamClient.Model.FlagResponse.t()] | nil,
          received_at: float() | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          type: String.t()
        }
end
