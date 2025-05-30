defmodule ExStreamClient.Model.UnreadCountsResponse do
  @moduledoc "Schema representing a UnreadCountsResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :channel_type,
    :channels,
    :threads,
    :total_unread_count,
    :total_unread_threads_count
  ]
  defstruct [:channel_type, :channels, :threads, :total_unread_count, :total_unread_threads_count]

  @nested_components channel_type: ExStreamClient.Model.UnreadCountsChannelType,
                     channels: ExStreamClient.Model.UnreadCountsChannel,
                     threads: ExStreamClient.Model.UnreadCountsThread
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_type: [ExStreamClient.Model.UnreadCountsChannelType.t()],
          channels: [ExStreamClient.Model.UnreadCountsChannel.t()],
          threads: [ExStreamClient.Model.UnreadCountsThread.t()],
          total_unread_count: integer(),
          total_unread_threads_count: integer()
        }
end
