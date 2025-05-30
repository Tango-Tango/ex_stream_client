defmodule ExStreamClient.Model.ReactionNewEvent do
  @moduledoc "Schema representing a ReactionNewEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :message,
    :reaction,
    :team,
    :thread_participants,
    :type,
    :user
  ]

  @nested_components %{
    message: ExStreamClient.Model.Message,
    user: ExStreamClient.Model.User,
    reaction: ExStreamClient.Model.Reaction,
    thread_participants: ExStreamClient.Model.User
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.Message.t() | nil,
          reaction: ExStreamClient.Model.Reaction.t() | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
