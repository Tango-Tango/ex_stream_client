defmodule ExStreamClient.Model.Role do
  @moduledoc "Schema representing a Role"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :name, :scopes, :updated_at]
  defstruct [:created_at, :custom, :name, :scopes, :updated_at]
  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: boolean(),
          name: String.t(),
          scopes: [String.t()],
          updated_at: DateTime.t() | integer() | String.t()
        }
end
