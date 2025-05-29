defmodule ExStreamClient.Model.AutomodSemanticFiltersRule do
  @moduledoc "Schema representing a AutomodSemanticFiltersRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :name, :threshold]
  defstruct [:name, :action, :threshold]
  @type t :: %__MODULE__{name: String.t(), action: :remove | :shadow | :flag, threshold: float()}
end