defmodule ExStreamClient.Model.WebhookEvent do
  @moduledoc "Schema representing a WebhookEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct []
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t ::
          ExStreamClient.Model.UserUpdatedEvent.t()
          | ExStreamClient.Model.UserUnreadReminderEvent.t()
          | ExStreamClient.Model.UserUnmutedEvent.t()
          | ExStreamClient.Model.UserUnbannedEvent.t()
          | ExStreamClient.Model.UserReactivatedEvent.t()
          | ExStreamClient.Model.UserMutedEvent.t()
          | ExStreamClient.Model.UserFlaggedEvent.t()
          | ExStreamClient.Model.UserDeletedEvent.t()
          | ExStreamClient.Model.UserDeactivatedEvent.t()
          | ExStreamClient.Model.UserBannedEvent.t()
          | ExStreamClient.Model.ThreadUpdatedEvent.t()
          | ExStreamClient.Model.ReviewQueueItemUpdatedEvent.t()
          | ExStreamClient.Model.ReviewQueueItemNewEvent.t()
          | ExStreamClient.Model.ReactionUpdatedEvent.t()
          | ExStreamClient.Model.ReactionNewEvent.t()
          | ExStreamClient.Model.ReactionDeletedEvent.t()
          | ExStreamClient.Model.NotificationMarkUnreadEvent.t()
          | ExStreamClient.Model.ModerationMarkReviewedEvent.t()
          | ExStreamClient.Model.ModerationFlaggedEvent.t()
          | ExStreamClient.Model.ModerationCustomActionEvent.t()
          | ExStreamClient.Model.ModerationCheckCompletedEvent.t()
          | ExStreamClient.Model.MessageUpdatedEvent.t()
          | ExStreamClient.Model.MessageUndeletedEvent.t()
          | ExStreamClient.Model.MessageUnblockedEvent.t()
          | ExStreamClient.Model.MessageReadEvent.t()
          | ExStreamClient.Model.MessageNewEvent.t()
          | ExStreamClient.Model.MessageNewEvent.t()
          | ExStreamClient.Model.MessageFlaggedEvent.t()
          | ExStreamClient.Model.MessageDeletedEvent.t()
          | ExStreamClient.Model.MemberUpdatedEvent.t()
          | ExStreamClient.Model.MemberRemovedEvent.t()
          | ExStreamClient.Model.MemberAddedEvent.t()
          | ExStreamClient.Model.FlagUpdatedEvent.t()
          | ExStreamClient.Model.ChannelVisibleEvent.t()
          | ExStreamClient.Model.ChannelUpdatedEvent.t()
          | ExStreamClient.Model.ChannelUnmutedEvent.t()
          | ExStreamClient.Model.ChannelUnFrozenEvent.t()
          | ExStreamClient.Model.ChannelTruncatedEvent.t()
          | ExStreamClient.Model.ChannelMutedEvent.t()
          | ExStreamClient.Model.ChannelHiddenEvent.t()
          | ExStreamClient.Model.ChannelFrozenEvent.t()
          | ExStreamClient.Model.ChannelDeletedEvent.t()
          | ExStreamClient.Model.ChannelCreatedEvent.t()
          | ExStreamClient.Model.CampaignStartedEvent.t()
          | ExStreamClient.Model.CampaignCompletedEvent.t()
          | ExStreamClient.Model.AsyncExportUsersEvent.t()
          | ExStreamClient.Model.AsyncExportModerationLogsEvent.t()
          | ExStreamClient.Model.AsyncExportErrorEvent.t()
          | ExStreamClient.Model.AsyncExportErrorEvent.t()
          | ExStreamClient.Model.AsyncExportErrorEvent.t()
          | ExStreamClient.Model.AsyncExportErrorEvent.t()
          | ExStreamClient.Model.AsyncExportChannelsEvent.t()
          | ExStreamClient.Model.AsyncBulkImageModerationEvent.t()
          | ExStreamClient.Model.AnyEvent.t()
end
