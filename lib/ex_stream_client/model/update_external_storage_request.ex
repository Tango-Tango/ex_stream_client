defmodule ExStreamClient.Model.UpdateExternalStorageRequest do
  @moduledoc "Schema representing a UpdateExternalStorageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bucket, :storage_type]
  defstruct [:aws_s3, :azure_blob, :bucket, :gcs_credentials, :path, :storage_type]

  @nested_components aws_s3: ExStreamClient.Model.S3Request,
                     azure_blob: ExStreamClient.Model.AzureRequest,
                     storage_type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          aws_s3: ExStreamClient.Model.S3Request.t() | nil,
          azure_blob: ExStreamClient.Model.AzureRequest.t() | nil,
          bucket: String.t(),
          gcs_credentials: String.t() | nil,
          path: String.t() | nil,
          storage_type: :abs | :gcs | :s3
        }
end
