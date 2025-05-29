defmodule ExStreamClient.Model.ChannelDeletedEvent do
  @moduledoc "Schema representing a ChannelDeletedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :type,
    :channel,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :channel_member_count
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          channel_member_count: integer()
        }
end