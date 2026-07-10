defmodule ExStreamClient.Model.AIImageConfig do
  @moduledoc "Schema representing a AIImageConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:async, :enabled, :ocr_rules, :rules]

  @nested_components ocr_rules: ExStreamClient.Model.OCRRule,
                     rules: ExStreamClient.Model.AWSRekognitionRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          ocr_rules: [ExStreamClient.Model.OCRRule.t()] | nil,
          rules: [ExStreamClient.Model.AWSRekognitionRule.t()] | nil
        }
end
