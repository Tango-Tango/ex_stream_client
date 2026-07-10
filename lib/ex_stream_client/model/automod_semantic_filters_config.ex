defmodule ExStreamClient.Model.AutomodSemanticFiltersConfig do
  @moduledoc "Schema representing a AutomodSemanticFiltersConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:async, :enabled, :rules]
  @nested_components rules: ExStreamClient.Model.AutomodSemanticFiltersRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          rules: [ExStreamClient.Model.AutomodSemanticFiltersRule.t()] | nil
        }
end
