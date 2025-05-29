defmodule ExStreamClient.Model.QueryMessageFlagsPayload do
  @moduledoc "Schema representing a QueryMessageFlagsPayload"
  use ExStreamClient.Jason
  defstruct [:offset, :user, :sort, :limit, :user_id, :filter_conditions, :show_deleted_messages]

  @type t :: %__MODULE__{
          offset: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          user_id: String.t() | nil,
          filter_conditions: map() | nil,
          show_deleted_messages: boolean() | nil
        }
end