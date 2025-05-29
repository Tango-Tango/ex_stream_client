defmodule ExStreamClient.Model.MessageDeletedEvent do
  @moduledoc "Schema representing a MessageDeletedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :hard_delete, :type]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :hard_delete,
    :message,
    :team,
    :thread_participants,
    :type,
    :user
  ]

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          hard_delete: boolean(),
          message: ExStreamClient.Model.Message.t() | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end