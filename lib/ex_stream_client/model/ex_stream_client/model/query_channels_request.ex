defmodule ExStreamClient.Model.QueryChannelsRequest do
  @moduledoc "Schema representing a QueryChannelsRequest"
  use ExStreamClient.Jason

  defstruct [
    :offset,
    :state,
    :user,
    :sort,
    :limit,
    :user_id,
    :filter_conditions,
    :member_limit,
    :message_limit
  ]

  @type t :: %__MODULE__{
          offset: integer() | nil,
          state: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          filter_conditions: map() | nil,
          member_limit: integer() | nil,
          message_limit: integer() | nil
        }
end