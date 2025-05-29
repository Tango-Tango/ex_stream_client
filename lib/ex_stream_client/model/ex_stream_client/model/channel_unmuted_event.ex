defmodule ExStreamClient.Model.ChannelUnmutedEvent do
  @moduledoc "Schema representing a ChannelUnmutedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:type, :created_at]
  @type t :: %__MODULE__{type: String.t(), created_at: float()}
end