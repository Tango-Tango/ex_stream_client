defmodule ExStreamClient.Model.UpsertExternalStorageAWSS3Request do
  @moduledoc "Schema representing a UpsertExternalStorageAWSS3Request"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bucket, :region, :role_arn]
  defstruct [:bucket, :path_prefix, :region, :role_arn]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bucket: String.t(),
          path_prefix: String.t() | nil,
          region: String.t(),
          role_arn: String.t()
        }
end
