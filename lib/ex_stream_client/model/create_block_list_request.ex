defmodule ExStreamClient.Model.CreateBlockListRequest do
  @moduledoc "Schema representing a CreateBlockListRequest"
  use ExStreamClient.Jason
  @enforce_keys [:name, :words]
  defstruct [:name, :type, :words, :team]

  @type t :: %__MODULE__{
          name: String.t(),
          type: (:word | :email | :domain_allowlist | :domain | :regex) | nil,
          words: [String.t()],
          team: String.t() | nil
        }
end