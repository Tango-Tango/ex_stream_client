defmodule ExStreamClient.Model.ModerationMarkReviewedEvent do
  @moduledoc "Schema representing a ModerationMarkReviewedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :item, :type]
  defstruct [:created_at, :custom, :item, :message, :received_at, :type]

  @nested_components created_at: :datetime,
                     item: ExStreamClient.Model.ReviewQueueItemResponse,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          item: ExStreamClient.Model.ReviewQueueItemResponse.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t()
        }
end
