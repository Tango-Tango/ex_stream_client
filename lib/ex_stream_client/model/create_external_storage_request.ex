defmodule ExStreamClient.Model.CreateExternalStorageRequest do
  @moduledoc "Schema representing a CreateExternalStorageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:bucket, :name, :storage_type]
  defstruct [:aws_s3, :azure_blob, :bucket, :gcs_credentials, :name, :path, :storage_type]

  @nested_components %{
    storage_type: :atom,
    aws_s3: ExStreamClient.Model.S3Request,
    azure_blob: ExStreamClient.Model.AzureRequest
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          aws_s3: ExStreamClient.Model.S3Request.t() | nil,
          azure_blob: ExStreamClient.Model.AzureRequest.t() | nil,
          bucket: String.t(),
          gcs_credentials: String.t() | nil,
          name: String.t(),
          path: String.t() | nil,
          storage_type: :abs | :gcs | :s3
        }
end
