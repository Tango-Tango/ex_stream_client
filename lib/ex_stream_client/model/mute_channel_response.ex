defmodule ExStreamClient.Model.MuteChannelResponse do
  @moduledoc "Schema representing a MuteChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :channel_mutes, :channel_mute, :own_user]

  @type t :: %__MODULE__{
          duration: String.t(),
          channel_mutes: [ExStreamClient.Model.ChannelMute.t()] | nil,
          channel_mute: ExStreamClient.Model.ChannelMute.t() | nil,
          own_user: ExStreamClient.Model.OwnUser.t() | nil
        }
end