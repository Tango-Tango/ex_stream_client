defmodule ExStreamClient.Model.S3Request do
  @moduledoc "Schema representing a S3Request"
  use ExStreamClient.Jason
  @enforce_keys [:s3_region]
  defstruct [:s3_api_key, :s3_custom_endpoint_url, :s3_region, :s3_secret]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          s3_api_key: String.t() | nil,
          s3_custom_endpoint_url: String.t() | nil,
          s3_region: String.t(),
          s3_secret: String.t() | nil
        }
end
