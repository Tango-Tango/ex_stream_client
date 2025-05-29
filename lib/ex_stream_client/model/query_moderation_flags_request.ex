defmodule ExStreamClient.Model.QueryModerationFlagsRequest do
  @moduledoc "Schema representing a QueryModerationFlagsRequest"
  use ExStreamClient.Jason
  defstruct [:filter, :limit, :next, :prev, :sort]

  @type t :: %__MODULE__{
          filter: map() | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParam.t()] | nil
        }
end