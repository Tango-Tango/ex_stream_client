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
    :title,
    :channel,
    :custom,
    :created_at,
    :created_by,
    :thread_participants,
    :updated_at,
    :deleted_at,
    :reply_count,
    :parent_message_id,
    :channel_cid,
    :created_by_user_id,
    :active_participant_count,
    :last_message_at,
    :parent_message,
    :participant_count
  ]

  @type t :: %__MODULE__{
          title: String.t(),
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          custom: map(),
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          thread_participants: [ExStreamClient.Model.ThreadParticipant.t()] | nil,
          updated_at: float(),
          deleted_at: float() | nil,
          reply_count: integer() | nil,
          parent_message_id: String.t(),
          channel_cid: String.t(),
          created_by_user_id: String.t(),
          active_participant_count: integer() | nil,
          last_message_at: float() | nil,
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil,
          participant_count: integer() | nil
        }
end