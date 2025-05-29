defmodule ExStreamClient.Model.VideoOrientation do
  @moduledoc "Schema representing a VideoOrientation"
  use ExStreamClient.Jason
  defstruct [:orientation]
  @type t :: %__MODULE__{orientation: integer() | nil}
end