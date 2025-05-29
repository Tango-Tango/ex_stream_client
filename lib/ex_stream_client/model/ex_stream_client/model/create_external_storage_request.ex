defmodule ExStreamClient.Model.CreateExternalStorageRequest do
  @moduledoc "Schema representing a CreateExternalStorageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :name, :storage_type]
  defstruct [:name, :path, :bucket, :gcs_credentials, :storage_type, :aws_s3, :azure_blob]

  @type t :: %__MODULE__{
          name: String.t(),
          path: String.t() | nil,
          bucket: String.t(),
          gcs_credentials: String.t() | nil,
          storage_type: :abs | :gcs | :s3,
          aws_s3: ExStreamClient.Model.S3Request.t() | nil,
          azure_blob: ExStreamClient.Model.AzureRequest.t() | nil
        }
end