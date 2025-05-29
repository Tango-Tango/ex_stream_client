defmodule ExStreamClient.Model.ReviewQueueItemUpdatedEvent do
  @moduledoc "Schema representing a ReviewQueueItemUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:flags, :type, :action, :custom, :created_at, :received_at, :review_queue_item]

  @type t :: %__MODULE__{
          flags: [ExStreamClient.Model.FlagResponse.t()] | nil,
          type: String.t(),
          action: ExStreamClient.Model.ActionLogResponse.t() | nil,
          custom: map(),
          created_at: float(),
          received_at: float() | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil
        }
end