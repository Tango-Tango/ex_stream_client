defmodule ExStreamClient.Model.PolicyRequest do
  @moduledoc "Schema representing a PolicyRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :name, :owner, :priority, :resources, :roles]
  defstruct [:action, :name, :owner, :priority, :resources, :roles]
  @nested_components action: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :Allow | :Deny,
          name: String.t(),
          owner: boolean(),
          priority: integer(),
          resources: [String.t()],
          roles: [String.t()]
        }
end
