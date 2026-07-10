defmodule ExStreamClient.Model.UserGroupMember do
  @moduledoc "Schema representing a UserGroupMember"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :created_at, :group_id, :is_admin, :user_id]
  defstruct [:app_pk, :created_at, :group_id, :is_admin, :user_id]
  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          group_id: String.t(),
          is_admin: boolean(),
          user_id: String.t()
        }
end
