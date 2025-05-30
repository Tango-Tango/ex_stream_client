defmodule ExStreamClient.Model.MessageReadEvent do
  @moduledoc "Schema representing a MessageReadEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [
    :channel_id,
    :channel_last_message_at,
    :channel_type,
    :cid,
    :created_at,
    :last_read_message_id,
    :team,
    :thread,
    :type,
    :user
  ]

  @nested_components thread: ExStreamClient.Model.ThreadResponse,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_last_message_at: float() | nil,
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          last_read_message_id: String.t() | nil,
          team: String.t() | nil,
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
