defmodule ExStreamClient.Model.HarmConfig do
  @moduledoc "Schema representing a HarmConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:action_sequences, :cooldown_period, :harm_types, :severity, :threshold]
  @nested_components action_sequences: ExStreamClient.Model.ActionSequence
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_sequences: [ExStreamClient.Model.ActionSequence.t()] | nil,
          cooldown_period: integer() | nil,
          harm_types: [String.t()] | nil,
          severity: integer() | nil,
          threshold: integer() | nil
        }
end
