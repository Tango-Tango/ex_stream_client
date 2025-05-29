defmodule ExStreamClient.Model.MuteChannelResponse do
  @moduledoc "Schema representing a MuteChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel_mute, :channel_mutes, :duration, :own_user]

  @type t :: %__MODULE__{
          channel_mute: ExStreamClient.Model.ChannelMute.t() | nil,
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()] | nil,
          duration: String.t(),
          own_user: ExStreamClient.Model.OwnUser.t() | nil
        }
end