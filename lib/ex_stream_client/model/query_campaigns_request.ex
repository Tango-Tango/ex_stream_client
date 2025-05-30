defmodule ExStreamClient.Model.QueryCampaignsRequest do
  @moduledoc "Schema representing a QueryCampaignsRequest"
  use ExStreamClient.Jason
  defstruct [:filter, :limit, :next, :prev, :sort, :user_limit]
  @nested_components sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: map() | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user_limit: integer() | nil
        }
end
