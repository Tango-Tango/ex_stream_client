defmodule ExStreamClient.Model.ImportTask do
  @moduledoc "Schema representing a ImportTask"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :history, :id, :mode, :path, :state, :updated_at]
  defstruct [:created_at, :history, :id, :mode, :path, :size, :state, :updated_at]
  @nested_components history: ExStreamClient.Model.ImportTaskHistory
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          history: [ExStreamClient.Model.ImportTaskHistory.t()],
          id: String.t(),
          mode: String.t(),
          path: String.t(),
          size: integer() | nil,
          state: String.t(),
          updated_at: float()
        }
end
