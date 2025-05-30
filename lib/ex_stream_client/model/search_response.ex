defmodule ExStreamClient.Model.SearchResponse do
  @moduledoc "Schema representing a SearchResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :results]
  defstruct [:duration, :next, :previous, :results, :results_warning]

  @nested_components %{
    results: ExStreamClient.Model.SearchResult,
    results_warning: ExStreamClient.Model.SearchWarning
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [ExStreamClient.Model.SearchResult.t()],
          results_warning: ExStreamClient.Model.SearchWarning.t() | nil
        }
end
