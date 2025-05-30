defmodule ExStreamClient.Model.ReactionUpdatedEvent do
  @moduledoc "Schema representing a ReactionUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :message, :reaction, :type]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :message,
    :reaction,
    :team,
    :type,
    :user
  ]

  @nested_components message: ExStreamClient.Model.Message,
                     reaction: ExStreamClient.Model.Reaction,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.Message.t(),
          reaction: ExStreamClient.Model.Reaction.t(),
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
