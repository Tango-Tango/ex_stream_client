defmodule ExStreamClient.Model.QueryPollVotesRequest do
  @moduledoc "Schema representing a QueryPollVotesRequest"
  use ExStreamClient.Jason
  defstruct [:filter, :limit, :next, :prev, :sort]

  @type t :: %__MODULE__{
          filter: map() | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end