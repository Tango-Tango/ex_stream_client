defmodule ExStreamClient.Model.ChannelTruncatedEvent do
  @moduledoc "Schema representing a ChannelTruncatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :type,
    :channel,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :channel_member_count
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          channel_member_count: integer()
        }
end