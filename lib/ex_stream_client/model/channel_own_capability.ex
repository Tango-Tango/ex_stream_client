defmodule ExStreamClient.Model.ChannelOwnCapability do
  @moduledoc "Schema representing a ChannelOwnCapability"
  use ExStreamClient.Jason
  defstruct []
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t ::
          :"upload-file"
          | :"update-thread"
          | :"update-own-message"
          | :"update-channel-members"
          | :"update-channel"
          | :"update-any-message"
          | :"typing-events"
          | :"slow-mode"
          | :"skip-slow-mode"
          | :"set-channel-cooldown"
          | :"send-typing-events"
          | :"send-restricted-visibility-message"
          | :"send-reply"
          | :"send-reaction"
          | :"send-poll"
          | :"send-message"
          | :"send-links"
          | :"send-custom-events"
          | :"search-messages"
          | :"read-events"
          | :"quote-message"
          | :"query-poll-votes"
          | :"pin-message"
          | :"mute-channel"
          | :"leave-channel"
          | :"join-channel"
          | :"freeze-channel"
          | :"flag-message"
          | :"delete-own-message"
          | :"delete-channel"
          | :"delete-any-message"
          | :"create-attachment"
          | :"connect-events"
          | :"cast-poll-vote"
          | :"ban-channel-members"
  @values [
    :"ban-channel-members",
    :"cast-poll-vote",
    :"connect-events",
    :"create-attachment",
    :"delete-any-message",
    :"delete-channel",
    :"delete-own-message",
    :"flag-message",
    :"freeze-channel",
    :"join-channel",
    :"leave-channel",
    :"mute-channel",
    :"pin-message",
    :"query-poll-votes",
    :"quote-message",
    :"read-events",
    :"search-messages",
    :"send-custom-events",
    :"send-links",
    :"send-message",
    :"send-poll",
    :"send-reaction",
    :"send-reply",
    :"send-restricted-visibility-message",
    :"send-typing-events",
    :"set-channel-cooldown",
    :"skip-slow-mode",
    :"slow-mode",
    :"typing-events",
    :"update-any-message",
    :"update-channel",
    :"update-channel-members",
    :"update-own-message",
    :"update-thread",
    :"upload-file"
  ]
  for value <- @values do
    _ = value
  end
end
