defmodule ExStreamClient.Model.QueryModerationConfigsRequest do
  @moduledoc "Schema representing a QueryModerationConfigsRequest"
  use ExStreamClient.Jason
  defstruct [:next, :prev, :user, :sort, :filter, :limit, :user_id]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          filter: map() | nil,
          limit: integer() | nil,
          user_id: String.t() | nil
        }
end