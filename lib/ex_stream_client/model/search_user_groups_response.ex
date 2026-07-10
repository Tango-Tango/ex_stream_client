defmodule ExStreamClient.Model.SearchUserGroupsResponse do
  @moduledoc "Schema representing a SearchUserGroupsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :user_groups]
  defstruct [:duration, :user_groups]
  @nested_components user_groups: ExStreamClient.Model.UserGroupResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          user_groups: [ExStreamClient.Model.UserGroupResponse.t()]
        }
end
