defmodule ExStreamClient.Model.BodyguardImageAnalysisConfig do
  @moduledoc "Schema representing a BodyguardImageAnalysisConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:rules]
  @nested_components rules: ExStreamClient.Model.BodyguardRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{rules: [ExStreamClient.Model.BodyguardRule.t()] | nil}
end
