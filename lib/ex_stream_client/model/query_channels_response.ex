defmodule ExStreamClient.Model.QueryChannelsResponse do
  @moduledoc "Schema representing a QueryChannelsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channels, :duration]
  defstruct [:channels, :duration]

  @type t :: %__MODULE__{
          channels: [ExStreamClient.Model.ChannelStateResponseFields.t()],
          duration: String.t()
        }
end