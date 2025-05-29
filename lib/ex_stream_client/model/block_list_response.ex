defmodule ExStreamClient.Model.BlockListResponse do
  @moduledoc "Schema representing a BlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:name, :type, :words]
  defstruct [:created_at, :id, :name, :team, :type, :updated_at, :words]

  @type t :: %__MODULE__{
          created_at: float() | nil,
          id: String.t() | nil,
          name: String.t(),
          team: String.t() | nil,
          type: String.t(),
          updated_at: float() | nil,
          words: [String.t()]
        }
end