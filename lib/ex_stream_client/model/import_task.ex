defmodule ExStreamClient.Model.ImportTask do
  @moduledoc "Schema representing a ImportTask"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :history, :id, :mode, :path, :state, :updated_at]
  defstruct [:created_at, :history, :id, :mode, :path, :size, :state, :updated_at]

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