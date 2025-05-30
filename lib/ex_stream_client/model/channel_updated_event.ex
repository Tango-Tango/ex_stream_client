defmodule ExStreamClient.Model.ChannelUpdatedEvent do
  @moduledoc "Schema representing a ChannelUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_member_count, :channel_type, :cid, :created_at, :type]
  defstruct [
    :channel,
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :created_at,
    :message,
    :team,
    :type,
    :user
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     message: ExStreamClient.Model.Message,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t(),
          channel_member_count: integer(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.Message.t() | nil,
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
