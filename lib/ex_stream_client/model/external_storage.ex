defmodule ExStreamClient.Model.ExternalStorage do
  @moduledoc "Schema representing a ExternalStorage"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :abs_account_name,
    :abs_client_id,
    :abs_client_secret,
    :abs_tenant_id,
    :bucket,
    :gcs_credentials,
    :path,
    :s3_api_key,
    :s3_custom_endpoint,
    :s3_region,
    :s3_secret_key,
    :storage_name,
    :storage_type
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          abs_account_name: String.t() | nil,
          abs_client_id: String.t() | nil,
          abs_client_secret: String.t() | nil,
          abs_tenant_id: String.t() | nil,
          bucket: String.t() | nil,
          gcs_credentials: String.t() | nil,
          path: String.t() | nil,
          s3_api_key: String.t() | nil,
          s3_custom_endpoint: String.t() | nil,
          s3_region: String.t() | nil,
          s3_secret_key: String.t() | nil,
          storage_name: String.t() | nil,
          storage_type: integer() | nil
        }
end
