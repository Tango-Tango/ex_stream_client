defmodule ExStreamClient.Model.Command do
  @moduledoc "Schema representing a Command"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:args, :description, :name, :set]
  defstruct [:args, :created_at, :description, :name, :set, :updated_at]
  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          args: String.t(),
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          description: String.t(),
          name: String.t(),
          set: String.t(),
          updated_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
