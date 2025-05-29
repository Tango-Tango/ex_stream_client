defmodule ExStreamClient.Model.GetReviewQueueItemResponse do
  @moduledoc "Schema representing a GetReviewQueueItemResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :item]

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil
        }
end