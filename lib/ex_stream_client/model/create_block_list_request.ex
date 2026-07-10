defmodule ExStreamClient.Model.CreateBlockListRequest do
  @moduledoc "Schema representing a CreateBlockListRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name, :words]
  defstruct [:is_leet_check_enabled, :is_plural_check_enabled, :name, :team, :type, :words]
  @nested_components type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          is_leet_check_enabled: boolean() | nil,
          is_plural_check_enabled: boolean() | nil,
          name: String.t(),
          team: String.t() | nil,
          type: (:word | :email_allowlist | :email | :domain_allowlist | :domain | :regex) | nil,
          words: [String.t()]
        }
end
