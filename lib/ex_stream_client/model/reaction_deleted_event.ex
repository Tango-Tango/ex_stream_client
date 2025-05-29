defmodule ExStreamClient.Model.ReactionDeletedEvent do
  @moduledoc "Schema representing a ReactionDeletedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [
    :message,
    :type,
    :user,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :thread_participants,
    :reaction
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
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          reaction: ExStreamClient.Model.Reaction.t() | nil
        }
end