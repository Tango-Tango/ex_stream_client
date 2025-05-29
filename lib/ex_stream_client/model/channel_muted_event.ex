defmodule ExStreamClient.Model.ChannelMutedEvent do
  @moduledoc "Schema representing a ChannelMutedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:type, :created_at]
  @type t :: %__MODULE__{type: String.t(), created_at: float()}
end