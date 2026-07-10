defmodule ExStreamClient.Model.ImportV2TaskSettingsS3 do
  @moduledoc "Schema representing a ImportV2TaskSettingsS3"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:bucket, :dir, :region]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bucket: String.t() | nil,
          dir: String.t() | nil,
          region: String.t() | nil
        }
end
