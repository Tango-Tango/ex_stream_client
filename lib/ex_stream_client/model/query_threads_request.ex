defmodule ExStreamClient.Model.QueryThreadsRequest do
  @moduledoc "Schema representing a QueryThreadsRequest"
  use ExStreamClient.Jason

  defstruct [
    :filter,
    :limit,
    :member_limit,
    :next,
    :participant_limit,
    :prev,
    :reply_limit,
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
          filter: map() | nil,
          limit: integer() | nil,
          member_limit: integer() | nil,
          next: String.t() | nil,
          participant_limit: integer() | nil,
          prev: String.t() | nil,
          reply_limit: integer() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
