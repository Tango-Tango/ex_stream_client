defmodule ExStreamClient.Model.UserDeletedEvent do
  @moduledoc "Schema representing a UserDeletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :created_at,
    :custom,
    :delete_conversation,
    :delete_conversation_channels,
    :delete_messages,
    :delete_user,
    :hard_delete,
    :mark_messages_deleted,
    :type,
    :user
  ]
  defstruct [
    :created_at,
    :custom,
    :delete_conversation,
    :delete_conversation_channels,
    :delete_messages,
    :delete_user,
    :hard_delete,
    :mark_messages_deleted,
    :received_at,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          delete_conversation: String.t(),
          delete_conversation_channels: boolean(),
          delete_messages: String.t(),
          delete_user: String.t(),
          hard_delete: boolean(),
          mark_messages_deleted: boolean(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t()
        }
end
