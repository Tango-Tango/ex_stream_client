defmodule ExStreamClient.Model.MessageDeletedEvent do
  @moduledoc "Schema representing a MessageDeletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :hard_delete, :type]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :hard_delete,
    :message,
    :team,
    :thread_participants,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.Message,
                     thread_participants: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          hard_delete: boolean(),
          message: ExStreamClient.Model.Message.t() | nil,
          team: String.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
