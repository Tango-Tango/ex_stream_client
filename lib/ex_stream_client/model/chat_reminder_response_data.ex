defmodule ExStreamClient.Model.ChatReminderResponseData do
  @moduledoc "Schema representing a ChatReminderResponseData"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_cid, :created_at, :message_id, :updated_at, :user_id]
  defstruct [
    :channel_cid,
    :created_at,
    :message,
    :message_id,
    :remind_at,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.ChatMessageResponse,
                     remind_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          message: ExStreamClient.Model.ChatMessageResponse.t() | nil,
          message_id: String.t(),
          remind_at: (DateTime.t() | integer() | String.t()) | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
