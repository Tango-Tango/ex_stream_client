defmodule ExStreamClient.Model.ChannelMute do
  @moduledoc "Schema representing a ChannelMute"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :updated_at]
  defstruct [:user, :channel, :created_at, :updated_at, :expires]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          updated_at: float(),
          expires: float() | nil
        }
end