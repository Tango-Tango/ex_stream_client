defmodule ExStreamClient.Model.UpdateExternalStorageRequest do
  @moduledoc "Schema representing a UpdateExternalStorageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :storage_type]
  defstruct [:path, :bucket, :gcs_credentials, :storage_type, :aws_s3, :azure_blob]

  @type t :: %__MODULE__{
          path: String.t() | nil,
          bucket: String.t(),
          gcs_credentials: String.t() | nil,
          storage_type: :abs | :gcs | :s3,
          aws_s3: ExStreamClient.Model.S3Request.t() | nil,
          azure_blob: ExStreamClient.Model.AzureRequest.t() | nil
        }
end