defmodule ExStreamClient.Model.ParsedPredefinedFilterResponse do
  @moduledoc "Schema representing a ParsedPredefinedFilterResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:filter, :name]
  defstruct [:filter, :name, :sort]
  @nested_components sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: %{optional(String.t()) => any()},
          name: String.t(),
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end
