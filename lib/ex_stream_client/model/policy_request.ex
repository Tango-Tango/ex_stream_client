defmodule ExStreamClient.Model.PolicyRequest do
  @moduledoc "Schema representing a PolicyRequest"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :owner, :priority, :resources, :roles]
  defstruct [:name, :owner, :priority, :action, :resources, :roles]

  @type t :: %__MODULE__{
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          action: :Allow | :Deny,
          resources: [String.t()],
          roles: [String.t()]
        }
end