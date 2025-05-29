defmodule ExStreamClient.Model.QueryReviewQueueResponse do
  @moduledoc "Schema representing a QueryReviewQueueResponse"
  use ExStreamClient.Jason
  @enforce_keys [:action_config, :duration, :items, :stats]
  defstruct [:next, :prev, :items, :stats, :duration, :action_config]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          items: [ExStreamClient.Model.ReviewQueueItemResponse.t()],
          stats: map(),
          duration: String.t(),
          action_config: map()
        }
end