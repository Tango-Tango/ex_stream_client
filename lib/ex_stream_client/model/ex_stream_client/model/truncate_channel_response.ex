defmodule ExStreamClient.Model.TruncateChannelResponse do
  @moduledoc "Schema representing a TruncateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:message, :channel, :duration]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t()
        }
end