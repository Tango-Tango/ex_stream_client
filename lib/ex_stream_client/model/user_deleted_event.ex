defmodule ExStreamClient.Model.UserDeletedEvent do
  @moduledoc "Schema representing a UserDeletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :created_at,
    :delete_conversation_channels,
    :hard_delete,
    :mark_messages_deleted,
    :type
  ]
  defstruct [
    :created_at,
    :delete_conversation_channels,
    :hard_delete,
    :mark_messages_deleted,
    :type,
    :user
  ]

  @nested_components created_at: :datetime, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          delete_conversation_channels: boolean(),
          hard_delete: boolean(),
          mark_messages_deleted: boolean(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
