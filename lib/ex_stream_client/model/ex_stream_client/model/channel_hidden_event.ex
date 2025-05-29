defmodule ExStreamClient.Model.ChannelHiddenEvent do
  @moduledoc "Schema representing a ChannelHiddenEvent"
  use ExStreamClient.Jason

  @enforce_keys [
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :clear_history,
    :created_at,
    :type
  ]
  defstruct [
    :type,
    :user,
    :channel,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :channel_member_count,
    :clear_history
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          channel_member_count: integer(),
          clear_history: boolean()
        }
end