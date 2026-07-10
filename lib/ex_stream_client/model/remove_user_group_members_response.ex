defmodule ExStreamClient.Model.RemoveUserGroupMembersResponse do
  @moduledoc "Schema representing a RemoveUserGroupMembersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :user_group]
  @nested_components user_group: ExStreamClient.Model.UserGroupResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          user_group: ExStreamClient.Model.UserGroupResponse.t() | nil
        }
end
