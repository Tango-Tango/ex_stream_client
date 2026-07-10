defmodule ExStreamClient.Model.DeliveryReceiptsResponse do
  @moduledoc "Schema representing a DeliveryReceiptsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean() | nil}
end
