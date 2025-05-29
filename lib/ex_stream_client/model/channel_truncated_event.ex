defmodule ExStreamClient.Model.ChannelTruncatedEvent do
  @moduledoc "Schema representing a ChannelTruncatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :channel,
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :type
  ]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t(),
          channel_member_count: integer(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          type: String.t()
        }
end