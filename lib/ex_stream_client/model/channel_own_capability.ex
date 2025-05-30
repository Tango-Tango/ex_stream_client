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
end
