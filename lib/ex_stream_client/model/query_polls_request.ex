defmodule ExStreamClient.Model.QueryPollsRequest do
  @moduledoc "Schema representing a QueryPollsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:filter, :limit, :next, :prev, :sort]
  @nested_components sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: %{optional(String.t()) => any()} | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end
