defmodule ExStreamClient.Model.ChannelDeletedEvent do
  @moduledoc "Schema representing a ChannelDeletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :channel,
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :team,
    :type
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse, created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t(),
          channel_member_count: integer(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          team: String.t() | nil,
          type: String.t()
        }
end
