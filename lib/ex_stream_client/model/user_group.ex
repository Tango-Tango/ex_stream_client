defmodule ExStreamClient.Model.UserGroup do
  @moduledoc "Schema representing a UserGroup"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :created_at, :id, :name, :updated_at]
  defstruct [
    :app_pk,
    :created_at,
    :created_by,
    :description,
    :id,
    :members,
    :name,
    :team_id,
    :updated_at
  ]

  @nested_components created_at: :datetime,
                     members: ExStreamClient.Model.UserGroupMember,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by: String.t() | nil,
          description: String.t() | nil,
          id: String.t(),
          members: [ExStreamClient.Model.UserGroupMember.t()] | nil,
          name: String.t(),
          team_id: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
