defmodule ExStreamClient.Model.ModerationRuleInfo do
  @moduledoc "Schema representing a ModerationRuleInfo"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:description, :id, :name, :type]
  defstruct [:description, :id, :name, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          description: String.t(),
          id: String.t(),
          name: String.t(),
          type: String.t()
        }
end
