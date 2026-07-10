defmodule ExStreamClient.Model.MessageUpdatedEvent do
  @moduledoc "Schema representing a MessageUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :message, :message_id, :type]
  defstruct [
    :channel_custom,
    :channel_id,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :custom,
    :message,
    :message_id,
    :message_update,
    :received_at,
    :team,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.MessageResponse,
                     message_update: ExStreamClient.Model.MessageUpdate,
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
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.MessageResponse.t(),
          message_id: String.t(),
          message_update: ExStreamClient.Model.MessageUpdate.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
