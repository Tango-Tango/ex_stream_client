defmodule ExStreamClient.Model.ReadStateResponse do
  @moduledoc "Schema representing a ReadStateResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:last_read, :unread_messages, :user]
  defstruct [:last_read, :last_read_message_id, :unread_messages, :user]
  @nested_components last_read: :datetime, user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          last_read: DateTime.t() | integer() | String.t(),
          last_read_message_id: String.t() | nil,
          unread_messages: integer(),
          user: ExStreamClient.Model.UserResponse.t()
        }
end
