defmodule ExStreamClient.Model.SearchResponse do
  @moduledoc "Schema representing a SearchResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :results]
  defstruct [:next, :duration, :results, :previous, :results_warning]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          duration: String.t(),
          results: [ExStreamClient.Model.SearchResult.t()],
          previous: String.t() | nil,
          results_warning: ExStreamClient.Model.SearchWarning.t() | nil
        }
end