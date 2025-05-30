defmodule ExStreamClient.Model.ThumbnailsSettings do
  @moduledoc "Schema representing a ThumbnailsSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean()}
end
