defmodule ExStreamClient.Model.QueryUsersPayload do
  @moduledoc "Schema representing a QueryUsersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [
    :filter_conditions,
    :include_deactivated_users,
    :limit,
    :offset,
    :presence,
    :sort,
    :user,
    :user_id
  ]

  @nested_components %{
    user: ExStreamClient.Model.UserRequest,
    sort: ExStreamClient.Model.SortParamRequest
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: map(),
          include_deactivated_users: boolean() | nil,
          limit: integer() | nil,
          offset: integer() | nil,
          presence: boolean() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
