defmodule ExStreamClient.Model.TypingIndicatorsResponse do
  @moduledoc "Schema representing a TypingIndicatorsResponse"
  use ExStreamClient.Jason
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean() | nil}
end