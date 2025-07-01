defmodule ExStreamClient.Model.AutomodSemanticFiltersRule do
  @moduledoc "Schema representing a AutomodSemanticFiltersRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :name, :threshold]
  defstruct [:action, :name, :threshold]
  @nested_components action: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{action: :remove | :shadow | :flag, name: String.t(), threshold: float()}
end
