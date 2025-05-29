defmodule ExStreamClient.Model.QuerySegmentsRequest do
  @moduledoc "Schema representing a QuerySegmentsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:filter]
  defstruct [:next, :prev, :sort, :filter, :limit]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map(),
          limit: integer() | nil
        }
end