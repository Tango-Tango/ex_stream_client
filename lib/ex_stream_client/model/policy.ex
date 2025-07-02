defmodule ExStreamClient.Model.Policy do
  @moduledoc "Schema representing a Policy"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :created_at, :name, :owner, :priority, :resources, :roles, :updated_at]
  defstruct [:action, :created_at, :name, :owner, :priority, :resources, :roles, :updated_at]
  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          resources: [String.t()],
          roles: [String.t()],
          updated_at: DateTime.t() | integer() | String.t()
        }
end
