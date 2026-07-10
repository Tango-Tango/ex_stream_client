defmodule ExStreamClient.Model.GetExternalStorageResponse do
  @moduledoc "Schema representing a GetExternalStorageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :duration, :type, :updated_at]
  defstruct [:aws_s3, :created_at, :duration, :type, :updated_at]

  @nested_components aws_s3: ExStreamClient.Model.GetExternalStorageAWSS3Response,
                     created_at: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          aws_s3: ExStreamClient.Model.GetExternalStorageAWSS3Response.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          duration: String.t(),
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
