defmodule ExStreamClient.Model.GetRetentionPolicyRunsRequest do
  @moduledoc "Schema representing a GetRetentionPolicyRunsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:filter_conditions, :limit, :next, :prev, :sort]
  @nested_components sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: %{optional(String.t()) => any()} | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end
