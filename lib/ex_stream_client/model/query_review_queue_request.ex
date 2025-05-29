defmodule ExStreamClient.Model.QueryReviewQueueRequest do
  @moduledoc "Schema representing a QueryReviewQueueRequest"
  use ExStreamClient.Jason

  defstruct [
    :filter,
    :limit,
    :lock_count,
    :lock_duration,
    :lock_items,
    :next,
    :prev,
    :sort,
    :stats_only,
    :user,
    :user_id
  ]

  @type t :: %__MODULE__{
          filter: map() | nil,
          limit: integer() | nil,
          lock_count: integer() | nil,
          lock_duration: integer() | nil,
          lock_items: boolean() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          stats_only: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end