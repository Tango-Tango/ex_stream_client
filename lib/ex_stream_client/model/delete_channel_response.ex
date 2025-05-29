defmodule ExStreamClient.Model.DeleteChannelResponse do
  @moduledoc "Schema representing a DeleteChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel, :duration]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t()
        }
end