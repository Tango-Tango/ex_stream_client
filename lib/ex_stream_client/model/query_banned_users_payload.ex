defmodule ExStreamClient.Model.QueryBannedUsersPayload do
  @moduledoc "Schema representing a QueryBannedUsersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [:exclude_expired_bans, :filter_conditions, :limit, :offset, :sort, :user, :user_id]

  @nested_components %{
    user: ExStreamClient.Model.UserRequest,
    sort: ExStreamClient.Model.SortParamRequest
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          exclude_expired_bans: boolean() | nil,
          filter_conditions: map(),
          limit: integer() | nil,
          offset: integer() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
