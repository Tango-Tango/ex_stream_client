defmodule ExStreamClient.Model.AIImageConfig do
  @moduledoc "Schema representing a AIImageConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :ocr_rules, :rules]
  defstruct [:async, :enabled, :rules, :ocr_rules]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.AWSRekognitionRule.t()],
          ocr_rules: [ExStreamClient.Model.OCRRule.t()]
        }
end