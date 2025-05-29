defmodule ExStreamClient.Model.MessageDeletedEvent do
  @moduledoc "Schema representing a MessageDeletedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :hard_delete, :type]
  defstruct [
    :message,
    :type,
    :user,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :hard_delete,
    :thread_participants
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          hard_delete: boolean(),
          thread_participants: [ExStreamClient.Model.User.t()] | nil
        }
end