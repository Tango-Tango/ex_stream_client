defmodule ExStreamClient.Model.MessageNewEvent do
  @moduledoc "Schema representing a MessageNewEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type, :watcher_count]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :message,
    :team,
    :thread_participants,
    :type,
    :user,
    :watcher_count
  ]

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.Message.t() | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          watcher_count: integer()
        }
end