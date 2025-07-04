defmodule ExStreamClient.Model.GetCommandResponse do
  @moduledoc "Schema representing a GetCommandResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:args, :description, :duration, :name, :set]
  defstruct [:args, :created_at, :description, :duration, :name, :set, :updated_at]
  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          args: String.t(),
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          description: String.t(),
          duration: String.t(),
          name: String.t(),
          set: String.t(),
          updated_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
