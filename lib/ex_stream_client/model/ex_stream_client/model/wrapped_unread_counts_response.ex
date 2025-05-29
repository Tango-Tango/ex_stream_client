defmodule ExStreamClient.Model.WrappedUnreadCountsResponse do
  @moduledoc "Schema representing a WrappedUnreadCountsResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :channel_type,
    :channels,
    :duration,
    :threads,
    :total_unread_count,
    :total_unread_threads_count
  ]
  defstruct [
    :threads,
    :duration,
    :channel_type,
    :total_unread_count,
    :channels,
    :total_unread_threads_count
  ]

  @type t :: %__MODULE__{
          threads: [ExStreamClient.Model.UnreadCountsThread.t()],
          duration: String.t(),
          channel_type: [ExStreamClient.Model.UnreadCountsChannelType.t()],
          total_unread_count: integer(),
          channels: [ExStreamClient.Model.UnreadCountsChannel.t()],
          total_unread_threads_count: integer()
        }
end