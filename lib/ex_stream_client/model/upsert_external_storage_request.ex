defmodule ExStreamClient.Model.UpsertExternalStorageRequest do
  @moduledoc "Schema representing a UpsertExternalStorageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:aws_s3, :type]
  @nested_components aws_s3: ExStreamClient.Model.UpsertExternalStorageAWSS3Request, type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          aws_s3: ExStreamClient.Model.UpsertExternalStorageAWSS3Request.t() | nil,
          type: :aws_s3
        }
end
