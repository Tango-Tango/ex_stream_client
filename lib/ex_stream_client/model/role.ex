defmodule ExStreamClient.Model.Role do
  @moduledoc "Schema representing a Role"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :name, :scopes, :updated_at]
  defstruct [:name, :custom, :created_at, :updated_at, :scopes]

  @type t :: %__MODULE__{
          name: String.t(),
          custom: boolean(),
          created_at: float(),
          updated_at: float(),
          scopes: [String.t()]
        }
end