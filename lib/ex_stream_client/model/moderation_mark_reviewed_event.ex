defmodule ExStreamClient.Model.ModerationMarkReviewedEvent do
  @moduledoc "Schema representing a ModerationMarkReviewedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :item, :message, :type, :user]

  @type t :: %__MODULE__{
          created_at: float(),
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end