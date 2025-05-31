defmodule ExStreamClient.Model.TypingIndicators do
  @moduledoc "Schema representing a TypingIndicators"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean()}
end
