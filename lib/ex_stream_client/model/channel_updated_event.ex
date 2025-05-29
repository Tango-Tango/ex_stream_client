defmodule ExStreamClient.Model.ChannelUpdatedEvent do
  @moduledoc "Schema representing a ChannelUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :message,
    :type,
    :user,
    :channel,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :channel_member_count
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          channel_member_count: integer()
        }
end