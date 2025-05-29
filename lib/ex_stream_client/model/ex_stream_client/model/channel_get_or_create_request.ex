defmodule ExStreamClient.Model.ChannelGetOrCreateRequest do
  @moduledoc "Schema representing a ChannelGetOrCreateRequest"
  use ExStreamClient.Jason

  defstruct [
    :data,
    :messages,
    :state,
    :members,
    :watchers,
    :hide_for_creator,
    :thread_unread_counts
  ]

  @type t :: %__MODULE__{
          data: ExStreamClient.Model.ChannelInput.t() | nil,
          messages: ExStreamClient.Model.MessagePaginationParams.t() | nil,
          state: boolean() | nil,
          members: ExStreamClient.Model.PaginationParams.t() | nil,
          watchers: ExStreamClient.Model.PaginationParams.t() | nil,
          hide_for_creator: boolean() | nil,
          thread_unread_counts: boolean() | nil
        }
end