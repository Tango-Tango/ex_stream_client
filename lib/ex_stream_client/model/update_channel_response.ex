defmodule ExStreamClient.Model.UpdateChannelResponse do
  @moduledoc "Schema representing a UpdateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members]
  defstruct [:channel, :duration, :members, :message]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMember.t()],
          message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end