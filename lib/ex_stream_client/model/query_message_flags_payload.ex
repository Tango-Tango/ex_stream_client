defmodule ExStreamClient.Model.QueryMessageFlagsPayload do
  @moduledoc "Schema representing a QueryMessageFlagsPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:filter_conditions, :limit, :offset, :show_deleted_messages, :sort, :user, :user_id]

  @nested_components sort: ExStreamClient.Model.SortParamRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: map() | nil,
          limit: integer() | nil,
          offset: integer() | nil,
          show_deleted_messages: boolean() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
