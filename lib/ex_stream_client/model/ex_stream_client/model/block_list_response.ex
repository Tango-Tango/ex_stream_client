defmodule ExStreamClient.Model.BlockListResponse do
  @moduledoc "Schema representing a BlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:name, :type, :words]
  defstruct [:id, :name, :type, :words, :team, :created_at, :updated_at]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          name: String.t(),
          type: String.t(),
          words: [String.t()],
          team: String.t() | nil,
          created_at: float() | nil,
          updated_at: float() | nil
        }
end