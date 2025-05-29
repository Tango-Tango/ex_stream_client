defmodule ExStreamClient.Model.QueryModerationLogsRequest do
  @moduledoc "Schema representing a QueryModerationLogsRequest"
  use ExStreamClient.Jason
  defstruct [:filter, :limit, :next, :prev, :sort, :user, :user_id]

  @type t :: %__MODULE__{
          filter: map() | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end