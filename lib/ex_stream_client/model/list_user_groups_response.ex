defmodule ExStreamClient.Model.ListUserGroupsResponse do
  @moduledoc "Schema representing a ListUserGroupsResponse"
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
