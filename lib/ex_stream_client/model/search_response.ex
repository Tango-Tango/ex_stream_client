defmodule ExStreamClient.Model.SearchResponse do
  @moduledoc "Schema representing a SearchResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :results]
  defstruct [:duration, :next, :previous, :results, :results_warning]

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [ExStreamClient.Model.SearchResult.t()],
          results_warning: ExStreamClient.Model.SearchWarning.t() | nil
        }
end