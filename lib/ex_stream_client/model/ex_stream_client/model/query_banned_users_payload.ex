defmodule ExStreamClient.Model.QueryBannedUsersPayload do
  @moduledoc "Schema representing a QueryBannedUsersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [:offset, :user, :sort, :limit, :user_id, :filter_conditions, :exclude_expired_bans]

  @type t :: %__MODULE__{
          offset: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          filter_conditions: map(),
          exclude_expired_bans: boolean() | nil
        }
end