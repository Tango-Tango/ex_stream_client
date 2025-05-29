defmodule ExStreamClient.Model.ModerationActionConfig do
  @moduledoc "Schema representing a ModerationActionConfig"
  use ExStreamClient.Jason
  @enforce_keys [:action, :custom, :description, :entity_type, :icon, :order]
  defstruct [:description, :action, :custom, :entity_type, :icon, :order]

  @type t :: %__MODULE__{
          description: String.t(),
          action: String.t(),
          custom: map(),
          entity_type: String.t(),
          icon: String.t(),
          order: integer()
        }
end