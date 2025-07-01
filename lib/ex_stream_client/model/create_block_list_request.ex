defmodule ExStreamClient.Model.CreateBlockListRequest do
  @moduledoc "Schema representing a CreateBlockListRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name, :words]
  defstruct [:name, :team, :type, :words]
  @nested_components type: :enum
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
