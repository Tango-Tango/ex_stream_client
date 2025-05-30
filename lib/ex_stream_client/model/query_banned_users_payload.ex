defmodule ExStreamClient.Model.QueryBannedUsersPayload do
  @moduledoc "Schema representing a QueryBannedUsersPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:filter_conditions]
  defstruct [:exclude_expired_bans, :filter_conditions, :limit, :offset, :sort, :user, :user_id]

  @nested_components sort: ExStreamClient.Model.SortParamRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          exclude_expired_bans: boolean() | nil,
          filter_conditions: %{optional(String.t()) => any()},
          limit: integer() | nil,
          offset: integer() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
