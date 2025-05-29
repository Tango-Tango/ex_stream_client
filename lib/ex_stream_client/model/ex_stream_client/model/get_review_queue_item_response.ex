defmodule ExStreamClient.Model.GetReviewQueueItemResponse do
  @moduledoc "Schema representing a GetReviewQueueItemResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:item, :duration]

  @type t :: %__MODULE__{
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          duration: String.t()
        }
end