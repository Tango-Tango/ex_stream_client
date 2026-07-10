defmodule ExStreamClient.Model.DailyValue do
  @moduledoc "Schema representing a DailyValue"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:date, :value]
  defstruct [:date, :value]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{date: String.t(), value: integer()}
end
