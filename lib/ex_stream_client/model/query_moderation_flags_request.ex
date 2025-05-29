defmodule ExStreamClient.Model.QueryModerationFlagsRequest do
  @moduledoc "Schema representing a QueryModerationFlagsRequest"
  use ExStreamClient.Jason
  defstruct [:next, :prev, :sort, :filter, :limit]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParam.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil
        }
end