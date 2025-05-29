defmodule ExStreamClient.Model.UpdateExternalStorageResponse do
  @moduledoc "Schema representing a UpdateExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :duration, :name, :path, :type]
  defstruct [:name, :type, :path, :duration, :bucket]

  @type t :: %__MODULE__{
          name: String.t(),
          type: :abs | :gcs | :s3,
          path: String.t(),
          duration: String.t(),
          bucket: String.t()
        }
end