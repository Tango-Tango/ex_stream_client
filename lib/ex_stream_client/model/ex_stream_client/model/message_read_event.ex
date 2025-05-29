defmodule ExStreamClient.Model.MessageReadEvent do
  @moduledoc "Schema representing a MessageReadEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [
    :type,
    :user,
    :thread,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :channel_last_message_at,
    :last_read_message_id
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          channel_last_message_at: float() | nil,
          last_read_message_id: String.t() | nil
        }
end