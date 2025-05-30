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
    :channel,
    :channel_id,
    :channel_member_count,
    :channel_type,
    :cid,
    :clear_history,
    :created_at,
    :type,
    :user
  ]

  @nested_components %{
    user: ExStreamClient.Model.User,
    channel: ExStreamClient.Model.ChannelResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t(),
          channel_member_count: integer(),
          channel_type: String.t(),
          cid: String.t(),
          clear_history: boolean(),
          created_at: float(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
