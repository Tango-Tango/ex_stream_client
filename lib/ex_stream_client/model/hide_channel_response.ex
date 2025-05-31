defmodule ExStreamClient.Model.HideChannelResponse do
  @moduledoc "Schema representing a HideChannelResponse"
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
