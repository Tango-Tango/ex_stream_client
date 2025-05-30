defmodule ExStreamClient.Model.AIImageConfig do
  @moduledoc "Schema representing a AIImageConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :ocr_rules, :rules]
  defstruct [:async, :enabled, :ocr_rules, :rules]

  @nested_components %{
    ocr_rules: ExStreamClient.Model.OCRRule,
    rules: ExStreamClient.Model.AWSRekognitionRule
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          ocr_rules: [ExStreamClient.Model.OCRRule.t()],
          rules: [ExStreamClient.Model.AWSRekognitionRule.t()]
        }
end
