defmodule ExStreamClient.Model.ExternalStorageResponse do
  @moduledoc "Schema representing a ExternalStorageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bucket, :name, :path, :type]
  defstruct [:bucket, :name, :path, :type]
  @nested_components type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bucket: String.t(),
          name: String.t(),
          path: String.t(),
          type: :abs | :gcs | :s3
        }
end
