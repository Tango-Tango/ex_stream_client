defmodule ExStreamClient.Model.ThreadResponse do
  @moduledoc "Schema representing a ThreadResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :channel_cid,
    :created_at,
    :created_by_user_id,
    :custom,
    :parent_message_id,
    :title,
    :updated_at
  ]
  defstruct [
    :active_participant_count,
    :channel,
    :channel_cid,
    :created_at,
    :created_by,
    :created_by_user_id,
    :custom,
    :deleted_at,
    :last_message_at,
    :parent_message,
    :parent_message_id,
    :participant_count,
    :reply_count,
    :thread_participants,
    :title,
    :updated_at
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_by: ExStreamClient.Model.UserResponse,
                     parent_message: ExStreamClient.Model.MessageResponse,
                     thread_participants: ExStreamClient.Model.ThreadParticipant
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          active_participant_count: integer() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_cid: String.t(),
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          created_by_user_id: String.t(),
          custom: map(),
          deleted_at: float() | nil,
          last_message_at: float() | nil,
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil,
          parent_message_id: String.t(),
          participant_count: integer() | nil,
          reply_count: integer() | nil,
          thread_participants: [ExStreamClient.Model.ThreadParticipant.t()] | nil,
          title: String.t(),
          updated_at: float()
        }
end
