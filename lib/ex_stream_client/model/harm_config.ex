defmodule ExStreamClient.Model.HarmConfig do
  @moduledoc "Schema representing a HarmConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_sequences, :severity]
  defstruct [:action_sequences, :severity]
  @nested_components action_sequences: ExStreamClient.Model.ActionSequence
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_sequences: [ExStreamClient.Model.ActionSequence.t()],
          severity: integer()
        }
end
