defmodule ExStreamClient.Model.EscalationMetadata do
  @moduledoc "Schema representing a EscalationMetadata"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:notes, :priority, :reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          notes: String.t() | nil,
          priority: String.t() | nil,
          reason: String.t() | nil
        }
end
