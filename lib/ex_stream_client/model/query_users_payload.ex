defmodule ExStreamClient.Model.QueryUsersPayload do
  @moduledoc "Schema representing a QueryUsersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [
    :offset,
    :user,
    :sort,
    :limit,
    :user_id,
    :filter_conditions,
    :include_deactivated_users,
    :presence
  ]

  @type t :: %__MODULE__{
          offset: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          filter_conditions: map(),
          include_deactivated_users: boolean() | nil,
          presence: boolean() | nil
        }
end