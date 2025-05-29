defmodule ExStreamClient.Model.QueryReviewQueueResponse do
  @moduledoc "Schema representing a QueryReviewQueueResponse"
  use ExStreamClient.Jason
  @enforce_keys [:action_config, :duration, :items, :stats]
  defstruct [:action_config, :duration, :items, :next, :prev, :stats]

  @type t :: %__MODULE__{
          action_config: map(),
          duration: String.t(),
          items: [ExStreamClient.Model.ReviewQueueItemResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          stats: map()
        }
end