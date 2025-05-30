defmodule ExStreamClient.Model.QueryModerationConfigsRequest do
  @moduledoc "Schema representing a QueryModerationConfigsRequest"
  use ExStreamClient.Jason
  defstruct [:filter, :limit, :next, :prev, :sort, :user, :user_id]

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
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
