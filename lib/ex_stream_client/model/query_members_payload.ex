defmodule ExStreamClient.Model.QueryMembersPayload do
  @moduledoc "Schema representing a QueryMembersPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions, :type]
  defstruct [:filter_conditions, :id, :limit, :members, :offset, :sort, :type, :user, :user_id]

  @nested_components members: ExStreamClient.Model.ChannelMember,
                     sort: ExStreamClient.Model.SortParamRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: map(),
          id: String.t() | nil,
          limit: integer() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          offset: integer() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
