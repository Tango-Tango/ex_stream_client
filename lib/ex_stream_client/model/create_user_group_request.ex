defmodule ExStreamClient.Model.CreateUserGroupRequest do
  @moduledoc "Schema representing a CreateUserGroupRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name]
  defstruct [:description, :id, :member_ids, :name, :team_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: String.t() | nil,
          member_ids: [String.t()] | nil,
          name: String.t(),
          team_id: String.t() | nil
        }
end
