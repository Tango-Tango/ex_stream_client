defmodule ExStreamClient.Model.AddUserGroupMembersRequest do
  @moduledoc "Schema representing a AddUserGroupMembersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:member_ids]
  defstruct [:as_admin, :member_ids, :team_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          as_admin: boolean() | nil,
          member_ids: [String.t()],
          team_id: String.t() | nil
        }
end
