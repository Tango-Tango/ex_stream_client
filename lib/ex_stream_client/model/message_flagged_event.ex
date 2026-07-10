defmodule ExStreamClient.Model.MessageFlaggedEvent do
  @moduledoc "Schema representing a MessageFlaggedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :message, :message_id, :type]
  defstruct [
    :channel_custom,
    :channel_id,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :custom,
    :details,
    :flag,
    :message,
    :message_id,
    :reason,
    :received_at,
    :team,
    :total_flags,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     details: ExStreamClient.Model.MessageModerationResult,
                     flag: ExStreamClient.Model.FlagResponse,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_message_count: integer() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          details: ExStreamClient.Model.MessageModerationResult.t() | nil,
          flag: ExStreamClient.Model.FlagResponse.t() | nil,
          message: ExStreamClient.Model.MessageResponse.t(),
          message_id: String.t(),
          reason: String.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          team: String.t() | nil,
          total_flags: integer() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
