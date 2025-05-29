defmodule ExStreamClient.Model.ImportTask do
  @moduledoc "Schema representing a ImportTask"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :history, :id, :mode, :path, :state, :updated_at]
  defstruct [:id, :size, :mode, :state, :path, :history, :created_at, :updated_at]

  @type t :: %__MODULE__{
          id: String.t(),
          size: integer() | nil,
          mode: String.t(),
          state: String.t(),
          path: String.t(),
          history: [ExStreamClient.Model.ImportTaskHistory.t()],
          created_at: float(),
          updated_at: float()
        }
end