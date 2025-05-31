defmodule ExStreamClient.Model.AutomodSemanticFiltersConfig do
  @moduledoc "Schema representing a AutomodSemanticFiltersConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled, :rules]
  defstruct [:async, :enabled, :rules]
  @nested_components rules: ExStreamClient.Model.AutomodSemanticFiltersRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.AutomodSemanticFiltersRule.t()]
        }
end
