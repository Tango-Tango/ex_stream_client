defmodule ExStreamClient.Model.PolicyRequest do
  @moduledoc "Schema representing a PolicyRequest"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :owner, :priority, :resources, :roles]
  defstruct [:action, :name, :owner, :priority, :resources, :roles]

  @type t :: %__MODULE__{
          action: :Allow | :Deny,
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          resources: [String.t()],
          roles: [String.t()]
        }
end