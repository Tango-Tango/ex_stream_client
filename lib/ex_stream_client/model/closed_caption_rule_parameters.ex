defmodule ExStreamClient.Model.ClosedCaptionRuleParameters do
  @moduledoc "Schema representing a ClosedCaptionRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:harm_labels, :llm_harm_labels, :threshold]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          harm_labels: [String.t()] | nil,
          llm_harm_labels: %{optional(String.t()) => String.t()} | nil,
          threshold: integer() | nil
        }
end
