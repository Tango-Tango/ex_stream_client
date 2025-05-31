defmodule ExStreamClient.Model.QueryModerationFlagsRequest do
  @moduledoc "Schema representing a QueryModerationFlagsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:filter, :limit, :next, :prev, :sort]
  @nested_components sort: ExStreamClient.Model.SortParam
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: %{optional(String.t()) => any()} | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParam.t()] | nil
        }
end
