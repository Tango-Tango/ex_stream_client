defmodule ExStreamClient.Model.ChannelUnmutedEvent do
  @moduledoc "Schema representing a ChannelUnmutedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :type]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{created_at: float(), type: String.t()}
end
