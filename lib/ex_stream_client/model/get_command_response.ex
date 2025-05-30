defmodule ExStreamClient.Model.GetCommandResponse do
  @moduledoc "Schema representing a GetCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:args, :description, :duration, :name, :set]
  defstruct [:args, :created_at, :description, :duration, :name, :set, :updated_at]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          args: String.t(),
          created_at: float() | nil,
          description: String.t(),
          duration: String.t(),
          name: String.t(),
          set: String.t(),
          updated_at: float() | nil
        }
end
