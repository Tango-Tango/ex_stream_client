defmodule ExStreamClient.Model.TruncateChannelResponse do
  @moduledoc "Schema representing a TruncateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel, :duration, :message]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end