defmodule ExStreamClient.Model.EventType do
  @lookup %{
    "*" => :any,
    "health.check" => :health_check,
    "typing.start" => :typing_start,
    "typing.stop" => :typing_stop,
    "message.new" => :message_new,
    "notification.message_new" => :notification_message_new,
    "notification.mark_read" => :notification_mark_read,
    "notification.mark_unread" => :notification_mark_unread,
    "message.deleted" => :message_deleted,
    "reaction.new" => :reaction_new,
    "reaction.deleted" => :reaction_deleted,
    "reaction.updated" => :reaction_updated,
    "message.updated" => :message_updated,
    "user.watching.start" => :user_watching_start,
    "user.watching.stop" => :user_watching_stop,
    "message.read" => :message_read,
    "channel.deleted" => :channel_deleted,
    "notification.channel_deleted" => :notification_channel_deleted,
    "channel.truncated" => :channel_truncated,
    "notification.channel_truncated" => :notification_channel_truncated,
    "notification.added_to_channel" => :notification_added_to_channel,
    "notification.removed_from_channel" => :notification_removed_from_channel,
    "channel.updated" => :channel_updated,
    "user.updated" => :user_updated,
    "member.added" => :member_added,
    "member.removed" => :member_removed,
    "member.updated" => :member_updated,
    "user.banned" => :user_banned,
    "user.unbanned" => :user_unbanned,
    "channel.hidden" => :channel_hidden,
    "channel.visible" => :channel_visible,
    "connection.changed" => :connection_changed,
    "connection.recovered" => :connection_recovered,
    "notification.invite_accepted" => :notification_invite_accepted,
    "notification.invited" => :notification_invited,
    "notification.mutes_updated" => :notification_mutes_updated,
    "ai_indicator.update" => :ai_indicator_update,
    "ai_indicator.stop" => :ai_indicator_stop,
    "ai_indicator.clear" => :ai_indicator_clear,
    "poll.updated" => :poll_updated,
    "poll.answer_casted" => :poll_answer_casted,
    "poll.vote_casted" => :poll_vote_casted,
    "poll.vote_changed" => :poll_vote_changed,
    "poll.vote_removed" => :poll_vote_removed,
    "poll.answer_removed" => :poll_answer_removed,
    "poll.closed" => :poll_closed,
    "poll.deleted" => :poll_deleted,
    "thread.updated" => :thread_updated,
    "notification.thread_message_new" => :notification_thread_message_new,
    "draft.updated" => :draft_updated,
    "draft.deleted" => :draft_deleted,
    "reminder.created" => :reminder_created,
    "reminder.updated" => :reminder_updated,
    "reminder.deleted" => :reminder_deleted,
    "notification.reminder_due" => :notification_reminder_due
  }

  @type t :: unquote(Enum.reduce(Map.values(@lookup), &{:|, [], [&1, &2]}))

  @spec from_string(String.t()) :: t | nil
  for {k, v} <- @lookup do
    def from_string(unquote(k)), do: unquote(v)
  end

  def from_string(event) when is_binary(event), do: nil

  @spec to_string(t) :: String.t() | nil
  for {k, v} <- @lookup do
    def to_string(unquote(v)), do: unquote(k)
  end

  def to_string(event) when is_atom(event), do: nil
end
