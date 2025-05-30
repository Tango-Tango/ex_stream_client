defmodule ExStreamClient.Model.ChannelGetOrCreateRequest do
  @moduledoc "Schema representing a ChannelGetOrCreateRequest"
  use ExStreamClient.Jason

  defstruct [
    :data,
    :hide_for_creator,
    :members,
    :messages,
    :state,
    :thread_unread_counts,
    :watchers
  ]

  @nested_components %{
    data: ExStreamClient.Model.ChannelInput,
    messages: ExStreamClient.Model.MessagePaginationParams,
    members: ExStreamClient.Model.PaginationParams,
    watchers: ExStreamClient.Model.PaginationParams
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          data: ExStreamClient.Model.ChannelInput.t() | nil,
          hide_for_creator: boolean() | nil,
          members: ExStreamClient.Model.PaginationParams.t() | nil,
          messages: ExStreamClient.Model.MessagePaginationParams.t() | nil,
          state: boolean() | nil,
          thread_unread_counts: boolean() | nil,
          watchers: ExStreamClient.Model.PaginationParams.t() | nil
        }
end
