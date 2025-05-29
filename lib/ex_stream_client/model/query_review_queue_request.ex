defmodule ExStreamClient.Model.QueryReviewQueueRequest do
  @moduledoc "Schema representing a QueryReviewQueueRequest"
  use ExStreamClient.Jason

  defstruct [
    :next,
    :prev,
    :user,
    :sort,
    :filter,
    :limit,
    :user_id,
    :lock_count,
    :lock_duration,
    :lock_items,
    :stats_only
  ]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          lock_count: integer() | nil,
          lock_duration: integer() | nil,
          lock_items: boolean() | nil,
          stats_only: boolean() | nil
        }
end