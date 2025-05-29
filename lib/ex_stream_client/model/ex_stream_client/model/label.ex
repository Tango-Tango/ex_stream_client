defmodule ExStreamClient.Model.Label do
  @moduledoc "Schema representing a Label"
  use ExStreamClient.Jason
  @enforce_keys [:name]
  defstruct [:name, :harm_labels, :phrase_list_ids]

  @type t :: %__MODULE__{
          name: String.t(),
          harm_labels: [String.t()] | nil,
          phrase_list_ids: [integer()] | nil
        }
end