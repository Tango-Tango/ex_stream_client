defmodule ExStreamClient.Model.IngressSource do
  @moduledoc "Schema representing a IngressSource"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:fps, :height, :width]
  defstruct [:fps, :height, :width]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{fps: integer(), height: integer(), width: integer()}
end
