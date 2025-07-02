defmodule ExStreamClient.Model.ReviewQueueItemNewEvent do
  @moduledoc "Schema representing a ReviewQueueItemNewEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:action, :created_at, :custom, :flags, :received_at, :review_queue_item, :type]

  @nested_components action: ExStreamClient.Model.ActionLogResponse,
                     created_at: :datetime,
                     flags: ExStreamClient.Model.FlagResponse,
                     received_at: :datetime,
                     review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: ExStreamClient.Model.ActionLogResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          flags: [ExStreamClient.Model.FlagResponse.t()] | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          review_queue_item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          type: String.t()
        }
end
