defmodule ExStreamClient.Model.UpdateChannelResponse do
  @moduledoc "Schema representing a UpdateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members]
  defstruct [:message, :channel, :duration, :members]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMember.t()]
        }
end