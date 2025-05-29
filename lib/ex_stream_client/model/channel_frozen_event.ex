defmodule ExStreamClient.Model.ChannelFrozenEvent do
  @moduledoc "Schema representing a ChannelFrozenEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:type, :created_at, :channel_id, :channel_type, :cid]

  @type t :: %__MODULE__{
          type: String.t(),
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t()
        }
end