defmodule ExStreamClient.Model.AutomodSemanticFiltersRule do
  @moduledoc "Schema representing a AutomodSemanticFiltersRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :threshold]
  defstruct [:action, :name, :threshold]
  @type t :: %__MODULE__{action: :remove | :shadow | :flag, name: String.t(), threshold: float()}
end