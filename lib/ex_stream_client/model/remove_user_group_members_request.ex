defmodule ExStreamClient.Model.RemoveUserGroupMembersRequest do
  @moduledoc "Schema representing a RemoveUserGroupMembersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:member_ids]
  defstruct [:member_ids, :team_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{member_ids: [String.t()], team_id: String.t() | nil}
end
