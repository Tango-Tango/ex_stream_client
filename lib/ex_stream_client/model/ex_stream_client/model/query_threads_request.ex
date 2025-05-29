defmodule ExStreamClient.Model.QueryThreadsRequest do
  @moduledoc "Schema representing a QueryThreadsRequest"
  use ExStreamClient.Jason

  defstruct [
    :next,
    :prev,
    :user,
    :sort,
    :filter,
    :limit,
    :user_id,
    :member_limit,
    :participant_limit,
    :reply_limit
  ]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          member_limit: integer() | nil,
          participant_limit: integer() | nil,
          reply_limit: integer() | nil
        }
end