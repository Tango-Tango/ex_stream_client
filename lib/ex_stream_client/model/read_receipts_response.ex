defmodule ExStreamClient.Model.ReadReceiptsResponse do
  @moduledoc "Schema representing a ReadReceiptsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean() | nil}
end
