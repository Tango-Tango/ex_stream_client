defmodule ExStreamClient.Model.UpdateExternalStorageResponse do
  @moduledoc "Schema representing a UpdateExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :duration, :name, :path, :type]
  defstruct [:bucket, :duration, :name, :path, :type]
  @nested_components type: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bucket: String.t(),
          duration: String.t(),
          name: String.t(),
          path: String.t(),
          type: :abs | :gcs | :s3
        }
end
