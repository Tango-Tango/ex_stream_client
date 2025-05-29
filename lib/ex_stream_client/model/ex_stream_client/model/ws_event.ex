defmodule ExStreamClient.Model.WSEvent do
  @moduledoc "Schema representing a WSEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [
    :connection_id,
    :message,
    :reason,
    :type,
    :member,
    :user,
    :thread,
    :me,
    :channel,
    :custom,
    :team,
    :created_at,
    :created_by,
    :channel_id,
    :channel_type,
    :cid,
    :channel_last_message_at,
    :user_id,
    :watcher_count,
    :poll,
    :parent_id,
    :thread_id,
    :reaction,
    :automoderation,
    :automoderation_scores,
    :message_update,
    :poll_vote
  ]

  @type t :: %__MODULE__{
          connection_id: String.t() | nil,
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          reason: String.t() | nil,
          type: String.t(),
          member: ExStreamClient.Model.ChannelMember.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          me: ExStreamClient.Model.OwnUserResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          custom: map(),
          team: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          channel_id: String.t() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          channel_last_message_at: float() | nil,
          user_id: String.t() | nil,
          watcher_count: integer() | nil,
          poll: ExStreamClient.Model.PollResponseData.t() | nil,
          parent_id: String.t() | nil,
          thread_id: String.t() | nil,
          reaction: ExStreamClient.Model.ReactionResponse.t() | nil,
          automoderation: boolean() | nil,
          automoderation_scores: ExStreamClient.Model.ModerationResponse.t() | nil,
          message_update: ExStreamClient.Model.MessageUpdate.t() | nil,
          poll_vote: ExStreamClient.Model.PollVoteResponseData.t() | nil
        }
end