defmodule ExStreamClient.Model.CheckS3AccessRequest do
  @moduledoc "Schema representing a CheckS3AccessRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:s3_url]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{s3_url: String.t() | nil}
end
