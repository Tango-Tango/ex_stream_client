defmodule ExStreamClient.Model.GoogleVisionConfig do
  @moduledoc "Schema representing a GoogleVisionConfig"
  use ExStreamClient.Jason
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean() | nil}
end