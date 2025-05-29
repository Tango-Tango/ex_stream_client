defmodule ExStreamClient.Model.ThumbnailsSettingsResponse do
  @moduledoc "Schema representing a ThumbnailsSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @type t :: %__MODULE__{enabled: boolean()}
end