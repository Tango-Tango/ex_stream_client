defmodule ExStreamClient.Model.ReactionUpdatedEvent do
  @moduledoc "Schema representing a ReactionUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :message, :reaction, :type]
  defstruct [
    :message,
    :type,
    :user,
    :team,
    :created_at,
    :channel_id,
    :channel_type,
    :cid,
    :reaction
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          reaction: ExStreamClient.Model.Reaction.t()
        }
end