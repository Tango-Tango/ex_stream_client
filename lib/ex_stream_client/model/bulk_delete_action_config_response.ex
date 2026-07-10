defmodule ExStreamClient.Model.BulkDeleteActionConfigResponse do
  @moduledoc "Schema representing a BulkDeleteActionConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:deleted, :duration]
  defstruct [:deleted, :duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{deleted: integer(), duration: String.t()}
end
