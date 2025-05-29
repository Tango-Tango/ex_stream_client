defmodule ExStreamClient.Model.Policy do
  @moduledoc "Schema representing a Policy"
  use ExStreamClient.Jason
  @enforce_keys [:action, :created_at, :name, :owner, :priority, :resources, :roles, :updated_at]
  defstruct [:name, :owner, :priority, :action, :created_at, :updated_at, :resources, :roles]

  @type t :: %__MODULE__{
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          action: integer(),
          created_at: float(),
          updated_at: float(),
          resources: [String.t()],
          roles: [String.t()]
        }
end