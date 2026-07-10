defmodule ExStreamClient.Model.AIImageLabelDefinition do
  @moduledoc "Schema representing a AIImageLabelDefinition"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:description, :group, :key, :label]
  defstruct [:description, :group, :key, :label]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          description: String.t(),
          group: String.t(),
          key: String.t(),
          label: String.t()
        }
end
