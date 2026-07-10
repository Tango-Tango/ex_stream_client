defmodule ExStreamClient.Model.UpdateUserGroupResponse do
  @moduledoc "Schema representing a UpdateUserGroupResponse"
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
