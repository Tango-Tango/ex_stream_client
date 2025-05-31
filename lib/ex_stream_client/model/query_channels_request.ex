defmodule ExStreamClient.Model.QueryChannelsRequest do
  @moduledoc "Schema representing a QueryChannelsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :filter_conditions,
    :limit,
    :member_limit,
    :message_limit,
    :offset,
    :sort,
    :state,
    :user,
    :user_id
  ]

  @nested_components sort: ExStreamClient.Model.SortParamRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: map() | nil,
          limit: integer() | nil,
          member_limit: integer() | nil,
          message_limit: integer() | nil,
          offset: integer() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          state: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
