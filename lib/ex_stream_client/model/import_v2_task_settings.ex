defmodule ExStreamClient.Model.ImportV2TaskSettings do
  @moduledoc "Schema representing a ImportV2TaskSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:merge_custom, :mode, :path, :s3, :skip_references_check, :source]
  @nested_components s3: ExStreamClient.Model.ImportV2TaskSettingsS3
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          merge_custom: boolean() | nil,
          mode: String.t() | nil,
          path: String.t() | nil,
          s3: ExStreamClient.Model.ImportV2TaskSettingsS3.t() | nil,
          skip_references_check: boolean() | nil,
          source: String.t() | nil
        }
end
