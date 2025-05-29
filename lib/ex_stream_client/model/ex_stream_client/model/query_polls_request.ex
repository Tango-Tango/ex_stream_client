defmodule ExStreamClient.Model.QueryPollsRequest do
  @moduledoc "Schema representing a QueryPollsRequest"
  use ExStreamClient.Jason
  defstruct [:next, :prev, :sort, :filter, :limit]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil
        }
end