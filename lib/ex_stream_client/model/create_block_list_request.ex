defmodule ExStreamClient.Model.CreateBlockListRequest do
  @moduledoc "Schema representing a CreateBlockListRequest"
  use ExStreamClient.Jason
  @enforce_keys [:name, :words]
  defstruct [:name, :team, :type, :words]
  @nested_components type: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          name: String.t(),
          team: String.t() | nil,
          type: (:word | :email | :domain_allowlist | :domain | :regex) | nil,
          words: [String.t()]
        }
end
