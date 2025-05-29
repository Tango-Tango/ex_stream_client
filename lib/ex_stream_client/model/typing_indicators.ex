defmodule ExStreamClient.Model.TypingIndicators do
  @moduledoc "Schema representing a TypingIndicators"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean()}
end