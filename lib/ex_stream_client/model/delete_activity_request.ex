defmodule ExStreamClient.Model.DeleteActivityRequest do
  @moduledoc "Schema representing a DeleteActivityRequest"
  use ExStreamClient.Jason
  defstruct [:hard_delete]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{hard_delete: boolean() | nil}
end
