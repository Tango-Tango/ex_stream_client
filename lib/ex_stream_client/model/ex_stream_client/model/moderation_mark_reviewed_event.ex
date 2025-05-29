defmodule ExStreamClient.Model.ModerationMarkReviewedEvent do
  @moduledoc "Schema representing a ModerationMarkReviewedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:message, :type, :user, :item, :created_at]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          created_at: float()
        }
end