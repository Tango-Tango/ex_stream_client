defmodule ExStreamClient.Model.Role do
  @moduledoc "Schema representing a Role"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :name, :scopes, :updated_at]
  defstruct [:created_at, :custom, :name, :scopes, :updated_at]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: boolean(),
          name: String.t(),
          scopes: [String.t()],
          updated_at: float()
        }
end