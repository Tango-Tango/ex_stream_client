defmodule ExStreamClient.Model.AIVideoConfig do
  @moduledoc "Schema representing a AIVideoConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :rules]
  defstruct [:async, :enabled, :rules]
  @nested_components rules: ExStreamClient.Model.AWSRekognitionRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.AWSRekognitionRule.t()]
        }
end
