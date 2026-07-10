defmodule ExStreamClient.Model.UndeleteMessageRequest do
  @moduledoc "Schema representing a UndeleteMessageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:undeleted_by]
  defstruct [:undeleted_by]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{undeleted_by: String.t()}
end
