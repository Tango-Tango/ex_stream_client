defmodule ExStreamClient.Model.QueryModerationLogsRequest do
  @moduledoc "Schema representing a QueryModerationLogsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:filter, :limit, :next, :prev, :sort, :user, :user_id]

  @nested_components sort: ExStreamClient.Model.SortParamRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter: %{optional(String.t()) => any()} | nil,
          limit: integer() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
