defmodule ExStreamClient.Model.QueryCampaignsRequest do
  @moduledoc "Schema representing a QueryCampaignsRequest"
  use ExStreamClient.Jason
  defstruct [:next, :prev, :sort, :filter, :limit, :user_limit]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil,
          user_limit: integer() | nil
        }
end