defmodule ExStreamClient.Model.WebhookFailoverConfig do
  @moduledoc "Schema representing a WebhookFailoverConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:gcs_bucket, :gcs_credentials, :gcs_path, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          gcs_bucket: String.t() | nil,
          gcs_credentials: String.t() | nil,
          gcs_path: String.t() | nil,
          type: String.t() | nil
        }
end
