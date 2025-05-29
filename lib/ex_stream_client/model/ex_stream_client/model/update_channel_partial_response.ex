defmodule ExStreamClient.Model.UpdateChannelPartialResponse do
  @moduledoc "Schema representing a UpdateChannelPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members]
  defstruct [:channel, :duration, :members]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMemberResponse.t()]
        }
end