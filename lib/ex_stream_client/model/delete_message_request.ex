defmodule ExStreamClient.Model.DeleteMessageRequest do
  @moduledoc "Schema representing a DeleteMessageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:hard_delete]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{hard_delete: boolean() | nil}
end
