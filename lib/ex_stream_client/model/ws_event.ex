defmodule ExStreamClient.Model.WSEvent do
  @moduledoc "Schema representing a WSEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [
    :automoderation,
    :automoderation_scores,
    :channel,
    :channel_id,
    :channel_last_message_at,
    :channel_type,
    :cid,
    :connection_id,
    :created_at,
    :created_by,
    :custom,
    :me,
    :member,
    :message,
    :message_update,
    :parent_id,
    :poll,
    :poll_vote,
    :reaction,
    :reason,
    :team,
    :thread,
    :thread_id,
    :type,
    :user,
    :user_id,
    :watcher_count
  ]

  @type t :: %__MODULE__{
          automoderation: boolean() | nil,
          automoderation_scores: ExStreamClient.Model.ModerationResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_id: String.t() | nil,
          channel_last_message_at: float() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          connection_id: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          me: ExStreamClient.Model.OwnUserResponse.t() | nil,
          member: ExStreamClient.Model.ChannelMember.t() | nil,
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          message_update: ExStreamClient.Model.MessageUpdate.t() | nil,
          parent_id: String.t() | nil,
          poll: ExStreamClient.Model.PollResponseData.t() | nil,
          poll_vote: ExStreamClient.Model.PollVoteResponseData.t() | nil,
          reaction: ExStreamClient.Model.ReactionResponse.t() | nil,
          reason: String.t() | nil,
          team: String.t() | nil,
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          thread_id: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t() | nil,
          watcher_count: integer() | nil
        }
end