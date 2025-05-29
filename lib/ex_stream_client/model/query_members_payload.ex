defmodule ExStreamClient.Model.QueryMembersPayload do
  @moduledoc "Schema representing a QueryMembersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions, :type]
  defstruct [:id, :offset, :type, :user, :sort, :limit, :user_id, :members, :filter_conditions]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          offset: integer() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          filter_conditions: map()
        }
end