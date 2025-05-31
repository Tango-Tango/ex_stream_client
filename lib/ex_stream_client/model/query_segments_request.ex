defmodule ExStreamClient.Model.QuerySegmentsRequest do
  @moduledoc "Schema representing a QuerySegmentsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:filter]
  defstruct [:filter, :limit, :next, :prev, :sort]
  @nested_components sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: map(),
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end
