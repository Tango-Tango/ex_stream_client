defmodule ExStreamClient.Model.VideoOrientation do
  @moduledoc "Schema representing a VideoOrientation"
  use ExStreamClient.Jason
  defstruct [:orientation]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{orientation: integer() | nil}
end
