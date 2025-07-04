defmodule ExStreamClient.Model.ThreadResponse do
  @moduledoc "Schema representing a ThreadResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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
                     created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponse,
                     deleted_at: :datetime,
                     last_message_at: :datetime,
                     parent_message: ExStreamClient.Model.MessageResponse,
                     thread_participants: ExStreamClient.Model.ThreadParticipant,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          active_participant_count: integer() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          created_by_user_id: String.t(),
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          last_message_at: (DateTime.t() | integer() | String.t()) | nil,
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil,
          parent_message_id: String.t(),
          participant_count: integer() | nil,
          reply_count: integer() | nil,
          thread_participants: [ExStreamClient.Model.ThreadParticipant.t()] | nil,
          title: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
