defmodule ExStreamClient.Model.QueryLabelResultsResponse do
  @moduledoc "Schema representing a QueryLabelResultsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :label_results]
  defstruct [:duration, :label_results, :next, :prev]
  @nested_components label_results: ExStreamClient.Model.LabelResultResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          label_results: [ExStreamClient.Model.LabelResultResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
