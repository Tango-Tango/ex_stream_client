defmodule ExStreamClient.Model.DeleteModerationConfigResponse do
  @moduledoc "Schema representing a DeleteModerationConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t()}
end
