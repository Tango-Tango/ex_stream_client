defmodule ExStreamClient.Model.Policy do
  @moduledoc "Schema representing a Policy"
  use ExStreamClient.Jason
  @enforce_keys [:action, :created_at, :name, :owner, :priority, :resources, :roles, :updated_at]
  defstruct [:action, :created_at, :name, :owner, :priority, :resources, :roles, :updated_at]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: integer(),
          created_at: float(),
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          resources: [String.t()],
          roles: [String.t()],
          updated_at: float()
        }
end
