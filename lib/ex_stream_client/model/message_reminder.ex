defmodule ExStreamClient.Model.MessageReminder do
  @moduledoc "Schema representing a MessageReminder"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_cid, :created_at, :message_id, :task_id, :updated_at, :user_id]
  defstruct [
    :channel,
    :channel_cid,
    :created_at,
    :message,
    :message_id,
    :remind_at,
    :task_id,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components channel: ExStreamClient.Model.Channel,
                     created_at: :datetime,
                     message: ExStreamClient.Model.Message,
                     remind_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          message: ExStreamClient.Model.Message.t() | nil,
          message_id: String.t(),
          remind_at: (DateTime.t() | integer() | String.t()) | nil,
          task_id: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t()
        }
end
