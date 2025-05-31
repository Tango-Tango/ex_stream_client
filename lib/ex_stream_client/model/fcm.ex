defmodule ExStreamClient.Model.FCM do
  @moduledoc "Schema representing a FCM"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:data]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{data: map() | nil}
end
