defmodule ExStreamClient.Model.ThumbnailsSettings do
  @moduledoc "Schema representing a ThumbnailsSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean()}
end