defmodule ExStreamClient.Model.MemberUpdatedEvent do
  @moduledoc "Schema representing a MemberUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel, :created_at, :custom, :member, :type]
  defstruct [
    :channel,
    :channel_custom,
    :channel_id,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :custom,
    :member,
    :received_at,
    :team,
    :type,
    :user
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     member: ExStreamClient.Model.ChannelMemberResponse,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t(),
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_message_count: integer() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          member: ExStreamClient.Model.ChannelMemberResponse.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
