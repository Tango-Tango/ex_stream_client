defmodule ExStreamClient.Model.ModerationActionConfig do
  @moduledoc "Schema representing a ModerationActionConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :custom, :description, :entity_type, :icon, :order]
  defstruct [:action, :custom, :description, :entity_type, :icon, :order]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          custom: %{optional(String.t()) => any()},
          description: String.t(),
          entity_type: String.t(),
          icon: String.t(),
          order: integer()
        }
end
