defmodule ExStreamClient.Model.ExternalStorageResponse do
  @moduledoc "Schema representing a ExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :name, :path, :type]
  defstruct [:name, :type, :path, :bucket]

  @type t :: %__MODULE__{
          name: String.t(),
          type: :abs | :gcs | :s3,
          path: String.t(),
          bucket: String.t()
        }
end