defmodule ExStreamClient.Model.BulkImageModerationRequest do
  @moduledoc "Schema representing a BulkImageModerationRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:csv_file]
  defstruct [:csv_file]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{csv_file: String.t()}
end
