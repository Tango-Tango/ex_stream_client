defmodule ExStreamClient.Model.QueryChannelsResponse do
  @moduledoc "Schema representing a QueryChannelsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channels, :duration]
  defstruct [:duration, :channels]

  @type t :: %__MODULE__{
          duration: String.t(),
          channels: [ExStreamClient.Model.ChannelStateResponseFields.t()]
        }
end